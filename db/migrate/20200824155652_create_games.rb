class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :subject
      t.string :topic
      t.integer :difficulty_level
      t.string :age_category
      t.integer :base_score

      t.timestamps
    end
  end
end
