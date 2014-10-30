class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    User.find_by_session_token(session[:token])
  end
  
  def logged_in?
    !session[:token].nil?
  end
  
  def login_user!(user)
    session[:token] = user.reset_session_token!
    redirect_to cats_url
  end
end
