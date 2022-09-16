class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :body
      t.references :recipe, null: false
      t.timestamps
    end
  end
end
