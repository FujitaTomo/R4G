class AddSteamToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :steam, :text
  end
end
