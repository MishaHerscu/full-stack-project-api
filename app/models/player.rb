#
class Player < ActiveRecord::Base
  belongs_to :team, inverse_of: :players
  belongs_to :user, inverse_of: :player
end
