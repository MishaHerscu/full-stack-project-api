#
class Game < ActiveRecord::Base
  belongs_to :team, foreign_key: :winner
  belongs_to :team, foreign_key: :loser
end
