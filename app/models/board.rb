class Board < ApplicationRecord
	belongs_to :user
	has_many :comments,:dependent => :destroy

	validates :board_title,presence: true, uniqueness: true
end
