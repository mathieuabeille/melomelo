class AddColumnsWhishes < ActiveRecord::Migration[5.0]
  def change
    add_column :wishes, :color, :string
    add_column :wishes, :gender, :string
    add_column :wishes, :price, :float
    add_column :wishes, :description, :string
    add_column :wishes, :brand, :string
  end
end
