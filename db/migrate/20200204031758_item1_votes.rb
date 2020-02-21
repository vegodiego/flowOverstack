class Item1Votes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :commAns, :string
  end
end
