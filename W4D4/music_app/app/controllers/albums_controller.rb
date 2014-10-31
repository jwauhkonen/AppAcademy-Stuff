class AlbumsController < ApplicationController
  before_action :verify_logged_in_user
  
  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
    
    render :new
  end
  
  def create
    @album = Album.new(album_params)
    
    if @album.save!
      redirect_to band_url(@album.band)
    else
      flash[:error] = "Not all required forms filled out"
      render :new
    end
  end
  
  def edit
    @album = Album.find(params[:id])
    
    render :edit
  end
  
  def update
    @album = Album.find(params[:id])
    
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:error] = "Not all required forms filled out"
      render :edit
    end
    
  end
  
  def show
    @album = Album.find(params[:id])
    @tracks = Track.all.where("album_id = ?", @album.id )
    
    render :show
  end
  
  def destroy
    band_id = Album.find(params[:id]).band_id
    Album.destroy(params[:id])
    
    redirect_to band_url(band_id)
  end
  
  
  private
  
  
  def album_params
    params.require(:album).permit(:title, :category, :band_id)
  end
  
end
