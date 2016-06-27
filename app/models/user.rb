#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples, inverse_of: :user, dependent: :destroy
  has_one :player, inverse_of: :user, dependent: :destroy
end
