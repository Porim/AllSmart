class AddAvatarKeyToKids < ActiveRecord::Migration[6.0]
  def change
    add_column :kids, :avatar_key, :string, default: 'https://res.cloudinary.com/djznzpxie/image/upload/v1599125065/okd26heqffak0vzi5oi3.svg'
  end
end
