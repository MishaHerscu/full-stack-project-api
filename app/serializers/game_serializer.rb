#
class GameSerializer < ActiveModel::Serializer
  attributes :id, :date, :winner, :loser
  # has_one :team
end
