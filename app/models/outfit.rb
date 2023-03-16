class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfits_items, dependent: :destroy
  has_many :items, through: :outfits_items
  has_many :items_occasions, through: :items
  has_many :occasions, through: :items_occasions
  has_many :items_weathers, through: :items
end
