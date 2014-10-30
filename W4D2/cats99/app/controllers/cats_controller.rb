class CatsController < ApplicationController
  # before_action :log_in_if_logged_in, only: [:show]
  before_action :verify_owner, only: [:edit, :update]
  before_action :verify_logged_in
  
  def index
    @cats = Cat.all
    render :index  
  end
  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end
  
  def new
    @cat = Cat.new
    render :new
  end
  
  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    
    if @cat.save
      redirect_to cat_url(@cat)
    else
      # render @cat.errors.full_messages status: :unprocessable_entity
      # flash.notice = "Cat not created"
      render :new
    end
  end
  
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def update
    @cat = Cat.find(params[:id])
    
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end
  
  private
  
  def verify_owner
    @cat = Cat.find(params[:id])
    redirect_to cats_url unless current_user.id == @cat.user_id
  end
  
  def verify_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
  def cat_params
    params.require(:cat).permit(:birth_date, :name, :color, :sex, :description,                                  :user_id)
  end
  #
  # def log_in_if_logged_in
  #   user = User.find_by_session_token(session[:token])
  #   if logged_in?
  #     user.session_token = session[:token]
  #
  # end
end
