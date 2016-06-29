#
class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :players, :games, :posts
end
