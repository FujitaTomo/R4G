class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :item

	validates :favo, presence: true
	validates :comment, presence: true
end
