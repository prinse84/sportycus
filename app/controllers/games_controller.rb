class GamesController < ApplicationController
  
  def show
    @season = Season.find(params[:season_id])
    @game = Game.find(params[:id])
  end
  
  def new
    @season = Season.find(params[:season_id])
    @game = Game.new
    @gamesites = Gamesite.all
    @gameresults = Gameresult.all
  end
  
  def create
    #@game = Game.new(game_params)
    @season = Season.find(params[:season_id])
    @game = @season.games.build()
    @game.opponent = game_params[:opponent]
    @game.game_date = game_params[:game_date]
    @game.game_time =  game_params[:game_time]
    @game.gamesite_id = game_params[:gamesite_id]
    @game.gameresult_id = game_params[:gameresult_id]
    if @game.save
      flash[:success] = "Game successfully added"  
      redirect_to season_game_url(@season, @game)
    else
      render 'new'
    end
  end
  
  def edit
    @season = Season.find(params[:season_id])
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    @season = Season.find(params[:season_id])
    if @game.update_attributes(game_params)
      flash[:success] = "Game updated"
      redirect_to season_game_url(@season, @game)
    else
      render 'edit'
    end
  end

  private
    def game_params
      params.require(:game).permit(:opponent, :game_date, :game_time, :gamesite_id, :gameresult_id, :season_id)
    end
  
end
