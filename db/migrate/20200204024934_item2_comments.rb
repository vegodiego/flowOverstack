class Item2Comments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :idCommAns, :string
  end
end
