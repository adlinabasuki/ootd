class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfits_items
  has_many :items, through: :outfits_items
end
