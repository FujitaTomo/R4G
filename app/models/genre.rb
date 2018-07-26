class Genre < ApplicationRecord
	has_many :items

	validates :genre, presence: true, uniqueness: true
	validates :priority,presence: true, uniqueness: true
end
