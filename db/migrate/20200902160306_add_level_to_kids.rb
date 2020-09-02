class AddLevelToKids < ActiveRecord::Migration[6.0]
  def change
    add_column :kids, :level, :integer
  end
end
