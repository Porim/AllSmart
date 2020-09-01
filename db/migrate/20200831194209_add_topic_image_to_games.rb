class AddTopicImageToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :topic_image_url, :string
  end
end
