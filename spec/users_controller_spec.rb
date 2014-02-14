require 'spec_helper'

describe 'users_controller' do

  it 'should bring user to sign up page' do
    get '/users/new'
    expect(last_response).to be_ok
  end

  describe 'sign up new user' do
    before :all do
      @user = User.new( email: 'orig@example.com')
      @user.password = 'banana'
      @user.save
    end

    after :all do
      @user.destroy
    end

    it 'should sign user up if unique' do
      new_params = {
        new_user: {
          email: 'geoff@example.com',
          password: 'banana'
        }
      }
      expect {
        post '/users', new_params, {}
      }.to change(User, :count).by (1)
      expect(last_response.status).to eq 302
      User.last.destroy
    end

    it 'should not sign user up if dup email' do
      new_params = {
        new_user: {
          email: 'orig@example.com',
          password: 'banana'
        }
      }
      expect {
        post '/users', new_params, {}
      }.to change(User, :count).by (0)
      expect(last_response.status).to eq 302
    end
  end

  describe 'user login form' do
    it 'should return user login page' do
      get '/sessions/new'
      expect(last_response).to be_ok
    end
  end

  describe 'login a user' do
    before :all do
      @user = User.new( email: 'geoff@example.com')
      @user.password = 'banana'
      @user.save
    end

    after :all do
      @user.destroy
    end

    it 'should login user with good credentials' do
      new_params = {
        login: {
          email: 'geoff@example.com',
          password: 'banana'
        }
      }
      post '/sessions', new_params, {}
      expect(last_response.status).to eq 302
      expect(last_request.env['rack.session']['user_id']).to eq @user.id
    end

    it 'should not login user with bad credentials' do
      new_params = {
        login: {
          email: 'geoff@example.com',
          password: 'badpass'
        }
      }
      post '/sessions', new_params, {}
      expect(last_response.status).to eq 302
      expect(last_request.env['rack.session']['user_id']).to be_nil
    end
  end

  describe 'logout a user' do

    before :each do
      @new_params = {
        :'_method' => "DELETE"
      }
      @new_session = {
        'rack.session' => {
          user_id: '23'
        }
      }
    end

    it 'should logout user with good credentials' do
      post '/sessions', @new_params, @new_session
      expect(last_response.status).to eq 302
      expect(last_request.env['rack.session']['user_id']).to be_nil
    end
  end
end