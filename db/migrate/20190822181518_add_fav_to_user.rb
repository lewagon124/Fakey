class AddFavToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fav, :string, array: true, :default =>[]
  end
end
