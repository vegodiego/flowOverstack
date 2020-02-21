class Item2Votes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :idCommAns, :string
  end
end
