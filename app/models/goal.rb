#
class Goal < ActiveRecord::Base
  belongs_to :player, inverse_of: :goals
  belongs_to :game, inverse_of: :goals
end
