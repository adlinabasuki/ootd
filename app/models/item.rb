class Item < ApplicationRecord
  belongs_to :user
  has_many :outfits_items
  has_many :items_occasions
  has_many :occasions, through: :items_occasions
  has_one_attached :photo

  self.inheritance_column = nil
end
