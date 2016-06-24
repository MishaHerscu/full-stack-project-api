#
class Game < ActiveRecord::Base
  # include Authentication
  belongs_to :team, inverse_of: :games
end
