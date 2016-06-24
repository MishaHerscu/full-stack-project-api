#
class Team < ActiveRecord::Base
  # include Authentication
  has_many :games, inverse_of: :team, dependent: :destroy
  has_many :players, inverse_of: :team, dependent: :destroy
end
