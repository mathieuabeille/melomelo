class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.references :clothe, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
