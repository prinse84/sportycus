class PlayersController < ApplicationController
  
  def index
    @players = Player.paginate(page: params[:page])
  end
  
  def show
    @player = Player.find(params[:id ])
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Player successfully added"  
      redirect_to @player
    else
      render 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:success] = "Player updated"
      redirect_to @player
    else
      render 'edit'
    end
  end
  
  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player deleted."
    redirect_to players_url
  end
  
  private
    def player_params
      params.require(:player).permit(:name, :moniker, :position_id)
    end
  
end
