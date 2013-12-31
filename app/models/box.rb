class Box < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  belongs_to :stat
  
  validates :player_id, presence: true
  validates :stat_id, presence: true  
  validates :game_id, presence: true  
  validates :value, presence: true    
  
  validates_numericality_of :value
  
end
