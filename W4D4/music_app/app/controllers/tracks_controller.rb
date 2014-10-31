class TracksController < ApplicationController
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    @track = Track.find(params[:id])
    
    render :show
  end
  
  def destroy
    
  end
  
end
