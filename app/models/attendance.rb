#
class Attendance < ActiveRecord::Base
  belongs_to :player, inverse_of: :attendances
  belongs_to :game, inverse_of: :attendances
end
