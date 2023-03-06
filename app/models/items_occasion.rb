class ItemsOccasion < ApplicationRecord
  belongs_to :item
  belongs_to :occasion
end
