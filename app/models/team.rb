#
class Team < ActiveRecord::Base
  has_many :games, inverse_of: :team, dependent: :destroy
  has_many :players, inverse_of: :team, dependent: :destroy
  has_many :posts, inverse_of: :team, dependent: :destroy
end
