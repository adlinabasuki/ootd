class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :outfits
  # has_many :occasions

  # after_create :create_occasions

  # def create_occasions
  #   Occasion.create(name: "WORK", user: self)
  #   Occasion.create(name: "NIGHT OUT", user: self)
  #   Occasion.create(name: "CASUAL", user: self)
  #   Occasion.create(name: "GYM", user: self)
  # end
end
