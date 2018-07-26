class Rating < ApplicationRecord
	has_many :items
	validates :rating, presence: true, uniqueness: true
end
