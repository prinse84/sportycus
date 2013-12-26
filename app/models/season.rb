class Season < ActiveRecord::Base
  validates :title, presence: true
  
  self.per_page = 5
  
end
