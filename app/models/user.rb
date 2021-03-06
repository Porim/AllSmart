class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,:recoverable, :rememberable, :validatable
  has_many :kids, dependent: :destroy
  has_many :allowed_games
  has_many :allowed_games, through: :kids
  has_one_attached :photo
  validates :first_name, :last_name, presence: true
  
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
