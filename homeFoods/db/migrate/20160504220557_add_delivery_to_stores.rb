class AddDeliveryToStores < ActiveRecord::Migration
  def change
    add_column :stores, :delivery, :false
  end
end
