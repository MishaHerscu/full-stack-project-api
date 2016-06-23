#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples, inverse_of: :user
  has_one :player, inverse_of: :user
end
