class Player < ActiveRecord::Base
  belongs_to :position
  validates :name, presence: true
  validates :position_id, presence: true  
  
  self.per_page = 5
end
