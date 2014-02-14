# Get user sign up form
get '/users/new' do
  erb :user_new
end

# Sign up a user
post '/users' do
  user = params[:new_user]
  pass = user.delete("password")
  @user = User.new(user)
  @user.password = pass
  if @user.save
    redirect "/"
  else
    redirect back
  end
end

get '/sessions/new' do
  erb :user_signin
end

# Logged in user is given option of create or take survey
get '/users/:user_id' do
  erb :user_page
end

# Sign in a user
post '/sessions' do
  creds = params[:login]
  unless @user = User.find_by_email(creds[:email])
    redirect back
  end
  if @user.password == creds["password"]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect back
  end
end

# Sign out a user
delete '/sessions' do
  session.delete(:user_id)
  redirect "/"
end