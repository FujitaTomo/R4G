class AddPriorityToGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :genres, :priority, :integer
  end
end
