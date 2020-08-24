class CreateKids < ActiveRecord::Migration[6.0]
  def change
    create_table :kids do |t|
      t.integer :age
      t.string :first_name
      t.string :last_name
      t.references :user, null: false, foreign_key: true
      t.integer :total_score

      t.timestamps
    end
  end
end
