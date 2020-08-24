class Kid < ApplicationRecord
  belongs_to :user
  has_many :allowed_games
end
