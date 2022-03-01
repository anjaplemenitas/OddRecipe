class Oddbox < ApplicationRecord
  belongs_to :user

  has_many :oddboxes_ingredients
  has_many :ingredients, through: :oddboxes_ingredients
end
