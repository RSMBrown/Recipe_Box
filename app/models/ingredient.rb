class Ingredient < ApplicationRecord
    has_many :ingredients_recipes, class_name: 'IngredientsRecipe', dependent: :destroy
    has_many :recipes, through: :ingredients_recipes, dependent: :destroy

    validates :body, presence: true 
end
