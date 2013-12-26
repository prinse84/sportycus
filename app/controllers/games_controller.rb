class GamesController < ApplicationController
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
    @game.gamesite_id = game_params[:gamesite]
    @game.gameresult_id = game_params[:gameresult]
    if @game.save
      flash[:success] = "Game successfully added"  
      redirect_to @game
    else
      render 'new'
    end
  end

  private
    def game_params
      params.require(:game).permit(:opponent, :game_date, :game_time, :gamesite, :gameresult, :season_id)
    end
  
end
