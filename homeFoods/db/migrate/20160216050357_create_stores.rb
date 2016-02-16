class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :filename
      t.string :name
      t.string :contactMethod
      t.string :contactId
      t.string :foodType
      t.string :description
      t.string :fromDay
      t.string :toDay
      t.string :fromHour
      t.string :fromZone
      t.string :toHour
      t.string :toZone
      t.string :tags
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
