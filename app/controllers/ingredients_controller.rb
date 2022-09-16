class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def search 
        if params[:search_by_ingredients].downcase && params[:search_by_ingredients].downcase != ""
            @recipes = Recipe.joins(:ingredients).where("ingredients.body LIKE ?", params[:search_by_ingredients])
        end
    end 

    def show 
        @ingredient = Ingredient.find(params[:id])
    end 

    def new 
        @ingredient = Ingredient.new 
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save 

            redirect_to ingredients_path
        else
            render :new 
        end 
    end 

    def destroy 
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy 

        redirect_to root_path 
    end 

    private 
    def ingredient_params 
        params.require(:ingredient).permit(:body, :id)
    end

    def recipe_params
        params.permit(:title)
    end 

    
end
