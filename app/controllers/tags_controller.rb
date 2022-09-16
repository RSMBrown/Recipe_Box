class TagsController < ApplicationController

    def index
        @tags = Tag.all
    end

    def show 
        @tag = Tag.find(params[:id])
        @recipe = Recipe.find(params[:recipe_id])
    end 

    def new 
        @tag = Tag.new 
        @recipe = Recipe.find(params[:recipe_id])
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @tag = Tag.find_or_create_by(tag_params)
        @tag.recipe_tags.create!(recipe_id: params[:recipe_id])

        if @tag.save!
            redirect_to @recipe
        else
            render :new 
        end 

    end 

    def edit 
        @tag = Tag.find(params[:tag_id])
        @recipe = Recipe.find(params[:recipe_id])
    end 

    def update 
        @tag = Tag.find(params[:id])
        @recipe = Recipe.find(params[:recipe_id])

        if @tag.update!(tag_params)
            redirect_to @recipe
        else 
            render :edit 
        end 
    end 

    def destroy 
        @tag = Tag.find(params[:tag_id])
        @tag.destroy

        redirect_to root_path
    end 

    private 
        def tag_params 
            params.require(:tag).permit(:title)
        end

end
