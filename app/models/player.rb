#
class Player < ActiveRecord::Base
  belongs_to :team, inverse_of: :players, dependent: :destroy
  belongs_to :user, inverse_of: :player, dependent: :destroy
  has_many :goals, inverse_of: :player, dependent: :destroy
  has_many :assists, inverse_of: :player, dependent: :destroy
  has_many :attendances, inverse_of: :player, dependent: :destroy
end
