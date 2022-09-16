class RatingsController < ApplicationController
    
    def create 
        @recipe = Recipe.find(params[:recipe_id])
        @rating = @recipe.create_rating!(rating_params)
        redirect_to recipe_path(@recipe)
    end 

    private 
        def rating_params
            params.require(:rating).permit(:body)
        end 
end
