class Item < ApplicationRecord
  belongs_to :user
  has_many :outfits_items
  has_many :items_occasions
  has_one_attached :photo

  TYPE_OPTIONS = ["TOP", "BOTTOM", "SHOE"]

  validates :name, presence: true, length: { maximum: 50 }
  validates :type, :photo, presence: true

  self.inheritance_column = nil
end
