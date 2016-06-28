#
class Game < ActiveRecord::Base
  belongs_to :team, inverse_of: :games, dependent: :destroy
end
