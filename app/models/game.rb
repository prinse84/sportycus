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
  
  def get_total_box(stat)
    sid = Stat.where(:abbreviation => stat)
    return self.boxes.where(:stat_id => sid).sum('value')
  end
  
end
