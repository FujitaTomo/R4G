class AddHardwareIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :hardware_id, :integer
  end
end
