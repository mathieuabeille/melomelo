class AddNewcolumnProductModel < ActiveRecord::Migration[5.0]
  def change
    add_column :clothes, :images_urls, :string, array: true
    add_column :clothes, :gender, :string
    add_column :clothes, :provider_url, :string
    add_column :clothes, :provider_id, :string
  end
end
