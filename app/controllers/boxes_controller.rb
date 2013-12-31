class BoxesController < ApplicationController
  
  def new
    @season = Season.find(params[:season_id])
    @game = Game.find(params[:game_id])
    @box= Box.new
  end
  
  def create
    @game = Game.find(params[:game_id])
    @season = Season.find(params[:season_id])
    boxes = []
    #boxes = params["box"]["stats"].values.collect{ |box| @game.boxes.build(:value => box) }   
    params["box"]["stats"].each do |s|
      stat = Stat.find_by_unique_identifier(s[0]).id
      boxes << @game.boxes.build(:value => s[1], :player_id => box_params[:player_id], :stat_id => stat)
    end
   # boxes.each do |b|
      #b.player_id = box_params[:player_id]
      #b.stat_id = Stat.find_by_abbreviation("AB").id
    #end
    
    if boxes.all?(&:valid?)
      boxes.each(&:save!)
      redirect_to season_game_url(@season, @game)
    else
      @box = Box.new
      render 'new'
    end
  end
  
  private
    def box_params
      params.require(:box).permit(:season_id, :game_id, :player_id, :stats)
    end
  
end
