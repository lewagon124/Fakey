class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :cost
      t.text :desc
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
