#
class Assist < ActiveRecord::Base
  belongs_to :player, inverse_of: :assists
  belongs_to :game, inverse_of: :assists
end
