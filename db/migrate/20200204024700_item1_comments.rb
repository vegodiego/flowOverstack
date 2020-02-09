class Item1Comments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :commAns, :string
  end
end
