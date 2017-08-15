class ChangeSizeFromStringToArray < ActiveRecord::Migration[5.0]
  def change
    remove_column :clothes, :size
    add_column :clothes, :sizes, :string, array: true
  end
end
