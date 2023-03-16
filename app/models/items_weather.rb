class ItemsWeather < ApplicationRecord
  belongs_to :item
  NAMES = ["DRY AND HOT", "DRY AND MEDIUM WARM", "DRY AND COLD", "RAINY AND HOT", "RAINY AND MEDIUM WARM", "RAINY AND COLD"]
end
