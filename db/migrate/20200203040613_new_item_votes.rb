class NewItemVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :user_id, :integer
  end
end
