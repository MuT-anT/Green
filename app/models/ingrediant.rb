class Ingrediant < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates_uniqueness_of :name
    has_many :recipe_ingrediants
    has_many :recipes, through: :recipe_ingrediants
end