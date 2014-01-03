class Stat < ActiveRecord::Base
  has_many :boxes, dependent: :destroy
  has_many :stats, :through => :boxes
  has_many :games, :through => :boxes
  
  validates :name, presence: true
  validates :abbreviation, presence: true 
  validates :stat_type, presence: true    
  
end
