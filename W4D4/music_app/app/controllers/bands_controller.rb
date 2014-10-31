class BandsController < ApplicationController
  
  def index
    @bands = Band.all
    
    render :index
  end
  
  def new
    @band = Band.new
    
    render :new
  end
  
  def create
    @band = Band.new(band_params)
    
    if @band.save!
      redirect_to bands_url
    else
      flash[:error] = "Please fill in a name"
      render :new
    end
  end
  
  def edit
    @band = Band.find(params[:id])
    
    render :edit
  end
  
  def update
    @band = Band.find(params[:id])
    
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:error] = "Please fill in a name"
      render :edit
    end
  end
  
  def show
    @band = Band.find(params[:id])
    @albums = Album.all.where("band_id = ?", @band.id)
    
    render :show
  end
  
  def destroy
    Band.destroy(params[:id])
    
    redirect_to bands_url
  end
  
  
  private
  
  
  def band_params
    params.require(:band).permit(:name)  
  end
  
end
