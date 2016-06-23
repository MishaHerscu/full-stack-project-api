#
class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :surname, :given_name, :email, :phone_number, :captain
  has_one :team
  has_one :user
end
