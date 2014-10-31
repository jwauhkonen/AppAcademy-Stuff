class AlbumsController < ApplicationController
  
  def new
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
    
  end
  
  def update
    
  end
  
  def show
    @album = Album.find(params[:id])
    @tracks = Track.all.where("album_id = ?", @album.id )
    
    render :show
  end
  
  def destroy
    
  end
  
  
  private
  
  
  def album_params
    params.require(:album).permit(:title, :category, :band_id)
  end
  
end
