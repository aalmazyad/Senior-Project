class AddFromMinuteToStores < ActiveRecord::Migration
  def change
    add_column :stores, :fromMinute, :string
  end
end
