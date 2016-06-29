#
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :player
  has_one :team
end
