#
class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :surname, :given_name, :email, :phone_number, :captain
end
