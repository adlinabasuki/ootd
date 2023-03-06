class Item < ApplicationRecord
  belongs_to :user
  has_many :outfits_items
  has_many :items_occasions
end
