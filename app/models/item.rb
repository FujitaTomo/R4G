class Item < ApplicationRecord
	attachment :image
	belongs_to :admin
	belongs_to :label
	belongs_to :genre
	belongs_to :rating
	belongs_to :hardware
	has_many :votes, :dependent => :destroy

	[:title, :genre_id,:label_id,:rating_id,:sale_date,:hardware_id ].each do |v|
   validates v, presence: true
end


   def voted_by?(user)
   	votes.where(user_id: user.id).exists?
   end

end
