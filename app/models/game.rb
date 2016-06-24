#
class Game < ActiveRecord::Base
  belongs_to :team, inverse_of: :games
end
