class AddImageUrlToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :image_url, :string
  end
end
