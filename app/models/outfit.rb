class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfits_items
end
