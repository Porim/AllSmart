class RemoveLevelFromKids < ActiveRecord::Migration[6.0]
  def change
    remove_column :kids, :level
  end
end
