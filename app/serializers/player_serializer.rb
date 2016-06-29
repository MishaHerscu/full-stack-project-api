#
class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :surname, :given_name, :email, :phone_number, :captain,
             :team_id, :user, :goals, :assists, :attendances, :posts
end
