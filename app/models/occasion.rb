class Occasion < ApplicationRecord
  belongs_to :user
  has_many :items_occasions
end
