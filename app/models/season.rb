class Season < ActiveRecord::Base
  has_many :games, dependent: :destroy
  validates :title, presence: true
  self.per_page = 5
  
end
