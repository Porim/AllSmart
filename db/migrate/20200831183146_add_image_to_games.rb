class AddImageToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :cloud_image_url, :string
  end
end
