class SeasonsController < ApplicationController
  
  def show
    @season = Season.find(params[:id])
  end 
  
  def new
    @season = Season.new
  end
  
  def create
    @season = Season.new(user_params)
    #@season = Season.new(params[:season])    # Not the final implementation!
    if @season.save
      flash[:success] = "Season successfully added"  
      redirect_to @season
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:season).permit(:title, :description)
    end
end
