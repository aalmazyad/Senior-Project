class AddShowAddressToStores < ActiveRecord::Migration
  def change
    add_column :stores, :showAddress, :false
  end
end
