#
class GameSerializer < ActiveModel::Serializer
  attributes :id, :date, :opponent, :won, :team, :goals, :assists, :attendances
end
