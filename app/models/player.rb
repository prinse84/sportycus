class Player < ActiveRecord::Base
  belongs_to :position
  has_many :boxes, dependent: :destroy
  has_many :stats, :through => :boxes
  has_many :games, :through => :boxes  
  validates :name, presence: true
  validates :position_id, presence: true  
  
  self.per_page = 5
end
