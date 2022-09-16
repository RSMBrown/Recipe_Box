class Tag < ApplicationRecord

    has_many :recipe_tags, class_name: 'RecipesTag', dependent: :destroy
    has_many :recipes, through: :recipe_tags, dependent: :destroy

    validates :title, presence: true 
end
