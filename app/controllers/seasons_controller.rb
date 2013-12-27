class SeasonsController < ApplicationController
  
  def index
    @seasons = Season.paginate(page: params[:page])
  end
    
  def show
    @season = Season.find(params[:id])
    @games = @season.games.paginate(page: params[:page])
  end 
  
  def new
    @season = Season.new
  end
  
  def create
    @season = Season.new(season_params)
    if @season.save
      flash[:success] = "Season successfully added"  
      redirect_to @season
    else
      render 'new'
    end
  end
  
  def edit
    @season = Season.find(params[:id])
  end
  
  def update
    @season = Season.find(params[:id])
    if @season.update_attributes(season_params)
      flash[:success] = "Season updated"
      redirect_to @season
    else
      render 'edit'
    end
  end
  
  def destroy
    Season.find(params[:id]).destroy
    flash[:success] = "Season deleted."
    redirect_to seasons_url
  end
  
  private
    def season_params
      params.require(:season).permit(:title, :description)
    end
end
