class ModifyClothes < ActiveRecord::Migration[5.0]
  def change
    add_column :clothes, :brand, :string, null: false
    add_column :clothes, :material, :string
  end
end
