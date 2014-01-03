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

    params["box"]["stats"].each do |s|
      stat = Stat.find_by_unique_identifier(s[0])
      boxes << @game.boxes.build(:value => s[1], :player_id => box_params[:player_id], :stat_id => stat.id)
    end
    
    if boxes.all?(&:valid?)
      boxes.each(&:save!)
      calculated_stats = ["hits","batting_average"]
      calculated_stats.each do |c|
        stat = Stat.find_by_unique_identifier(c)
        @box = @game.boxes.build(:value =>@game.get_calculated_field_value_by_player(stat,box_params[:player_id]), :player_id => box_params[:player_id], :stat_id => stat.id)
        @box.save!
      end
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
