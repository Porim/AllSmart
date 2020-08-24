class AllowedGame < ApplicationRecord
  belongs_to :game
  belongs_to :kid
end
