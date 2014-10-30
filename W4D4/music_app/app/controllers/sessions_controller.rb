class SessionsController < ApplicationController
  
  def new
    @user = User.new
    
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    
    if @user
      login_user!(@user)
      redirect_to new_user_url
    else
      flash.now[:errors] = "Bad email/password combination"
      @user = User.new(email: params[:user][:email])
      render :new
    end
    
  end
  
  def destroy
    @user = current_user
    
    @user.reset_session_token!
    session[:token] = nil
    redirect_to new_user_url
  end
  
end
