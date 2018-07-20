class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :user_id
      t.integer :item_id
      t.integer :favo
      t.text :comment

      t.timestamps
    end
  end
end
