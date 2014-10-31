class TracksController < ApplicationController
  before_action :verify_logged_in_user
  
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    
    render :new
  end
  
  def create
    @track = Track.new(track_params)
    
    if @track.save!
      redirect_to album_url(@track.album)
    else
      flash[:error] = "Not all forms filled out"
      render :new
    end
  end
  
  def edit
    @track = Track.find(params[:id])
    
    render :edit
  end
  
  def update
    @track = Track.find(params[:id])
    
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:error] = "Not all required forms filled out"
      render :edit
    end
  end
  
  def show
    @track = Track.find(params[:id])
    
    render :show
  end
  
  def destroy
    album_id = Track.find(params[:id]).album_id
    Track.destroy(params[:id])
    
    redirect_to album_url(album_id)
  end
  
  
  def track_params
    params.require(:track).permit(:album_id, :category, :title, :lyrics)  
  end
  
end
