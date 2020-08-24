class CreateAllowedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :allowed_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :kid, null: false, foreign_key: true
      t.float :time_taken
      t.integer :score

      t.timestamps
    end
  end
end
