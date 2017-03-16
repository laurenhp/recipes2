class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :dish
      t.integer :user_id
      t.string :ingredients
      t.string :instructions
      t.string :recipe_url

      t.timestamps

    end
  end
end
