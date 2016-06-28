#
class Game < ActiveRecord::Base
  belongs_to :team, inverse_of: :games, dependent: :destroy
  has_many :goals, inverse_of: :game, dependent: :destroy
  has_many :assists, inverse_of: :game, dependent: :destroy
  has_many :attendances, inverse_of: :game, dependent: :destroy
end
