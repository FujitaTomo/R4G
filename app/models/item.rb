class Item < ApplicationRecord
	attachment :image
	belongs_to :admin
	belongs_to :label
	belongs_to :genre
	belongs_to :rating
	belongs_to :hardware
	has_many :votes
end
