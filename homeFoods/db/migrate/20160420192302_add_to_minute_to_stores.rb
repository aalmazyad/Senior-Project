class AddToMinuteToStores < ActiveRecord::Migration
  def change
    add_column :stores, :toMinute, :string
  end
end
