class RemoveImageIdToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :image_id, :string
  end
end
