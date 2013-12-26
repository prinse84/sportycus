class Game < ActiveRecord::Base
  belongs_to :season   
  belongs_to :gameresult 
  belongs_to :gamesite
  validates :season_id, presence: true
  validates :game_date, presence: true
  validates :opponent, presence: true 
  validates :gameresult_id, presence: true  
  validates :gamesite_id, presence: true      
  default_scope -> { order('created_at DESC') }
  
  self.per_page = 5
end
