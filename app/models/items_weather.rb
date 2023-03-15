class ItemsWeather < ApplicationRecord
  belongs_to :item
  NAMES = ["dry and hot", "dry and medium warm", "dry and cold", "rainy and hot", "rainy and medium warm", "rainy and cold"]
end
