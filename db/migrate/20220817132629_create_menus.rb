class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.float :difficulty, null: false
      t.integer :price
      t.integer :time
      t.integer :number, null: false
      t.integer :genre_id, null: false
      t.string :impression
      t.integer :calorie
      t.string :way, null: false
      t.integer :authority, null: false
      t.timestamps
    end
  end
end
