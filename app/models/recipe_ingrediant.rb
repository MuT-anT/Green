class RecipeIngrediant < ApplicationRecord
    belongs_to :ingrediant
    belongs_to :recipe
end