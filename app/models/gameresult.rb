class Gameresult < ActiveRecord::Base
    has_many :games, dependent: :destroy
    validates :name, presence: true
    validates :abbreviation, presence: true
end
