class CreateRecipeIngrediants < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingrediants do |t|
      t.integer :recipe_id
      t.integer :ingrediant_id
      t.timestamps
    end
  end
end
