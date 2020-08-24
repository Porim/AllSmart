class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :kids, dependent: :destroy
  has_many :allowed_games
  has_many :allowed_games, through: :kids

  validates :first_name, :last_name,  presence: true
end
