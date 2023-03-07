class Occasion < ApplicationRecord
  has_many :items_occasions
  # belongs_to :user
  OCCASION_OPTIONS = ["WORK", "PARTY", "CASUAL", "WORKOUT"]
end
