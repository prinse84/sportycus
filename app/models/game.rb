class Game < ActiveRecord::Base
  belongs_to :season   
  belongs_to :gameresult 
  belongs_to :gamesite
  
  has_many :boxes, dependent: :destroy
  #accepts_nested_attributes_for :boxes
  has_many :stats, :through => :boxes
  has_many :players, :through => :boxes
    
  validates :season_id, presence: true
  validates :game_date, presence: true
  validates :opponent, presence: true 
  validates :gameresult_id, presence: true  
  validates :gamesite_id, presence: true      
  validates_numericality_of :team_runs, :only_integer => true
  validates_numericality_of :opponent_team_runs, :only_integer => true  
  
  default_scope -> { order('created_at DESC') }
  
  self.per_page = 5

  def get_player_box
    players = self.players.uniq
    result = []
    players.each do |p|
      box = {}
      box['player'] = p
       stats = self.boxes.where(:player_id => p.id)
       stats.each do |s|
         box[s.stat.abbreviation] = s.value
       end
      result << box
    end
    return result
  end
    
  def get_total_box(abbrev)
    stat = Stat.find_by_abbreviation(abbrev)
    if stat.stat_type == 'raw'
      total = self.boxes.where(:stat_id => stat).sum('value')
    elsif stat.stat_type == 'calculated'
      data = JSON.parse(stat.formula)
      total = 0      
      if data["function"] == 'SUM'
          data["stats"].each do |s|
            calc_stat = Stat.find_by_unique_identifier(s)
            total = total + self.boxes.where(:stat_id => calc_stat.id).sum('value')
          end
      elsif data["function"] == 'DIV'
        calc_stat_numerator = self.get_total_box(Stat.find_by_unique_identifier(data["stats"][0]).abbreviation)
        calc_stat_denumenator = self.get_total_box(Stat.find_by_unique_identifier(data["stats"][1]).abbreviation)
        if calc_stat_denumenator != 0
          total = calc_stat_numerator / calc_stat_denumenator
        end
      end
    end
    return total
  end
  
  def get_calculated_field_value_by_player(stat, player)
    data = JSON.parse(stat.formula)
    if data["function"] == 'SUM'
      total = 0
      data["stats"].each do |s|
        calc_stat = Stat.find_by_unique_identifier(s)
        total = total + self.boxes.where(:player_id => player, :stat_id => calc_stat.id).first.value
      end
    elsif data["function"] == 'DIV'
      calc_stat_numerator = Stat.find_by_unique_identifier(data["stats"][0])
      calc_stat_denumenator = Stat.find_by_unique_identifier(data["stats"][1])
      total = self.boxes.where(:player_id => player, :stat_id => calc_stat_numerator.id).first.value/self.boxes.where(:player_id => player, :stat_id => calc_stat_denumenator.id).first.value
    else
      total = 0
    end
    return total
  end
  
  def does_total_runs_match_result?
    if !get_total_box('R').nil?
      if get_total_box('R') != self.team_runs
        true
      end    
    end
  end
  
end
