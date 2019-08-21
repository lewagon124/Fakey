class AddCartToUser < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :cart, :string, array: true, :default =>[]
   end
end
