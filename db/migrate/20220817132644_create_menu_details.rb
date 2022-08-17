class CreateMenuDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_details do |t|
      t.integer :menu_id, null: false
      t.string :name, null: false
      t.string :amount
      t.timestamps
    end
  end
end
