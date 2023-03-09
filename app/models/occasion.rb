class Occasion < ApplicationRecord
  has_many :items_occasions
  # belongs_to :user
  # OCCASION_OPTIONS = ["WORK", "PARTY", "CASUAL", "WORKOUT"] should NOT be used. We have seeds for this
end
