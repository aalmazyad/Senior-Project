class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :filename
      t.string :name
      t.string :foodType
      t.string :description
      t.string :tags
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
