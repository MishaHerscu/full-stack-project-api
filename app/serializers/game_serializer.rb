#
class GameSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :team
end
