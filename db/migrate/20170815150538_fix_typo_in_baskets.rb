class FixTypoInBaskets < ActiveRecord::Migration[5.0]
  def change
    remove_column :baskets, :clothe_id
    add_reference :baskets, :cloth
  end
end
