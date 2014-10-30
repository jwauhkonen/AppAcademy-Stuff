class UsersController < ApplicationController
  before_action :already_signed_in, only: [:create, :new]
  
  def new
    @user = User.new
    render :new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
     login_user!(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
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
