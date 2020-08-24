class Kid < ApplicationRecord
  belongs_to :user
  has_many :allowed_games, dependent: :destroy

  validates :age, presence: true, numericality: { only_integer: true }
end
