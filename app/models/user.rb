class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :votes ,:dependent => :destroy
         has_many :boards ,:dependent => :destroy
         has_many :comments,:dependent => :destroy
         has_many :contacts,:dependent => :destroy

  validates :name, presence: true, uniqueness: true,length: {in: 1..10}

end
