class CreateRecipesTags < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes_tags do |t|
      t.references :tag, foreign_key: true 
      t.references :recipe, foreign_key: true 

      t.timestamps
    end
  end
end
