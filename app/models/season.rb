class Season < ActiveRecord::Base
  validates :title, presence: true
  
end
