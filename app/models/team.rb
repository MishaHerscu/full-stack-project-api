#
class Team < ActiveRecord::Base
  # include Authentication
  has_many :games, inverse_of: :team
  has_many :players, inverse_of: :team
end
