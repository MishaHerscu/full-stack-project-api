#
class GoalSerializer < ActiveModel::Serializer
  attributes :id
  has_one :player
  has_one :game
end
