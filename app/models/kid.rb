class Kid < ApplicationRecord
  belongs_to :user
  has_many :allowed_games, dependent: :destroy
  has_one_attached :photo
  validates :age, presence: true, numericality: { only_integer: true }
end
