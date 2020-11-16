class AddAvatarKeyToKids < ActiveRecord::Migration[6.0]
  def change
    add_column :kids, :avatar_key, :string, default: "okd26heqffak0vzi5oi3"
  end
end
