#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :player, :admin
end
