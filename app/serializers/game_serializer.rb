#
class GameSerializer < ActiveModel::Serializer
  attributes :id, :date, :opponent, :won, :team
end
