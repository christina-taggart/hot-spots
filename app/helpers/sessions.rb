helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find(session[:user_id]) if session[:user_id]
  end

end