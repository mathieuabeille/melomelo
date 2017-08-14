class CreateClothes < ActiveRecord::Migration[5.0]
  def change
    create_table :clothes do |t|
      t.string :name, null: false
      t.string :description
      t.string :size, null: false
      t.string :color
      t.float :price, null: false
      t.string :tags, array: true, default: []
    end
  end
end
