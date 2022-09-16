class Recipe < ApplicationRecord
    has_one :rating, dependent: :destroy

    has_many :recipe_tags, class_name: 'RecipesTag', dependent: :destroy
    has_many :tags, through: :recipe_tags

    has_many :ingredients_recipes, class_name: 'IngredientsRecipe', dependent: :destroy
    has_many :ingredients, through: :ingredients_recipes

    accepts_nested_attributes_for :tags, :rating, allow_destroy: true 
    
    validates :title, presence: true 
    validates :body, presence: true
end
