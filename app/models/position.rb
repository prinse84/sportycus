class Position < ActiveRecord::Base
  has_many :players, dependent: :nullify
  validates :name, presence: true
  validates :abbreviation, presence: true  
end
