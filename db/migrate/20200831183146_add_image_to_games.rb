class AddImageToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :cloud_imag_url, :string
  end
end
