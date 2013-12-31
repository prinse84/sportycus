class GamesController < ApplicationController
  
  def show
    @season = Season.find(params[:season_id])
    @game = Game.find(params[:id])
    @box = @game.get_player_box
  end
  
  def new
    @season = Season.find(params[:season_id])
    @game = Game.new
    @gamesites = Gamesite.all
    @gameresults = Gameresult.all
  end
  
  def create
    @season = Season.find(params[:season_id])
    @game = @season.games.build(game_params)
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

  def destroy
    @season = Season.find(params[:season_id])
    @season.games.find(params[:id]).destroy
    flash[:success] = "Game deleted."
    redirect_to season_url(@season)
  end
  
  private
    def game_params
      params.require(:game).permit(:opponent, :game_date, :game_time, :gamesite_id, :gameresult_id, :season_id, :team_runs, :opponent_team_runs)
    end
  
end
