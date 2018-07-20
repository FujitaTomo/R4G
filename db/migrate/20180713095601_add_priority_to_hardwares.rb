class AddPriorityToHardwares < ActiveRecord::Migration[5.1]
  def change
    add_column :hardwares, :priority, :integer
  end
end
