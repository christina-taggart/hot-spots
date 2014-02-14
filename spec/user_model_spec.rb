require 'spec_helper'

describe User do
  it { should respond_to :email }
  it { should respond_to :password_hash }
  it { should respond_to :password }
  it { should have_many :location_users }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_hash }
  it { should have_many :locations }

  it 'test unique email' do
    if User.where(email: 'k@fed.com').length == 0
      User.create!(email: 'k@fed.com', password_hash: 'password_hash')
    end

    user = User.new(email: 'k@fed.com', password_hash: 'woops' )
    expect(user).not_to be_valid
  end

  describe 'user authentication' do
    before do
      @user = User.new(email: 'lebron@miamiheat.com')
      @user.password="banana"
      @user.save
    end

    after do
      @user.destroy
    end

    it 'should authorize when correct password given' do
      expect(@user.password=="banana").to be_true
    end

    it 'should reject with incorrect password' do
      expect(@user.password=="fake").to be_false
    end
  end
end
