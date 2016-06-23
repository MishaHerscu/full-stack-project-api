#
class Team < ActiveRecord::Base
  has_many :games, inverse_of: :team
  has_many :players, inverse_of: :team
end
