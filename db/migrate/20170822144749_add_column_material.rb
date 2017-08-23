class AddColumnMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :wishes, :material, :string
  end
end
