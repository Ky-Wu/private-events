module SessionsHelper
  
  def sign_in(user_id)
    session[:user_id] = user_id
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

end
