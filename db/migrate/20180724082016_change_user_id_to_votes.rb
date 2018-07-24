class ChangeUserIdToVotes < ActiveRecord::Migration[5.1]
  def up
  	change_column :votes, :user_id, :integer
  end

  def down
  	change_column :votes, :user_id, :string
  end
end
