class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :ingredient, uniqueness: {scope: :cocktail}
  validates :description, presence: true
end
