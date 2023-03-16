class Item < ApplicationRecord
  belongs_to :user
  has_many :outfits_items, dependent: :destroy
  has_many :items_occasions, dependent: :destroy
  has_many :occasions, through: :items_occasions
  has_one_attached :photo
  has_many :items_weathers, dependent: :destroy

  TYPE_OPTIONS = ["TOP", "BOTTOM", "SHOE"]
  LAUNDRY_OPTIONS = ["CLEAN", "DIRTY"]

  validates :name, presence: true, length: { maximum: 50 }
  validates :type, :photo, presence: true

  self.inheritance_column = nil
end
