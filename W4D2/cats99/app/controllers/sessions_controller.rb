class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]
  
  def new
    @user = User.new
    
    render :new
  end
  
  def create
    found = User.find_by_credentials(user_params[:user_name],
                                     user_params[:password])
                          
    if found
      @user = found
      login_user!(@user)
    else
      @user = User.new(user_name: user_params[:user_name])
      flash.now[:errors] = "Bad Username/Password combination."
      render :new
    end
  end
  
  def destroy
    @user = User.find_by_session_token(session[:token])
    session[:token] = nil
    @user.reset_session_token!
    
    redirect_to new_session_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
  
  def already_signed_in
    if logged_in?
      redirect_to cats_url
    end
  end

end
