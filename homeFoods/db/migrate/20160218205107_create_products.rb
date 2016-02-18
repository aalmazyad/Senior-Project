class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :filename
      t.string :name
      t.string :description
      t.string :quantity
      t.string :price
      t.references :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
