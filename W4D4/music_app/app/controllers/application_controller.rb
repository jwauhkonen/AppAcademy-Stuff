class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def login_user!(user)
    session[:token] = user.reset_session_token!
  end
  
  def current_user
    User.find_by_session_token(session[:token])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def verify_logged_in_user
    redirect_to new_session_url unless logged_in?
  end
  
end
