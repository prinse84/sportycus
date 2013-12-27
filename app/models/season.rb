class Season < ActiveRecord::Base
  has_many :games, dependent: :destroy
  validates :title, presence: true
  self.per_page = 5
  
  def total_wins
    games.where(:gameresult_id => 1).count
  end
  
  def total_losses
    games.where(:gameresult_id => 2).count
  end
  
  def total_draws
    games.where(:gameresult_id => 3).count
  end
  
end
