#
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :updated_at
  has_one :player
  has_one :team
end
