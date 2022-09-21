class CreateIngrediants < ActiveRecord::Migration[7.0]
  def create
    create_table :ingrediants do |t|
      t.name :string
      t.timestamps
    end
  end
end
