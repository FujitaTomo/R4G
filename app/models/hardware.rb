class Hardware < ApplicationRecord
	has_many :items
	validates :hardware, presence: true, uniqueness: true
	validates :priority,presence: true, uniqueness: true
end
