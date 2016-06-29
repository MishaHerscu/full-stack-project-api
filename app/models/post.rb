#
class Post < ActiveRecord::Base
  belongs_to :player, inverse_of: :posts
  belongs_to :team, inverse_of: :posts
end
