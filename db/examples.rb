# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(misha cooper josh jake).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'abc123',
               password_confirmation: 'abc123')
end

Team.create(
  [
    {
      name: 'Weapon X'
    },
    {
      name: 'Blue'
    },
    {
      name: 'Green'
    }
  ]
)

Player.create(
  [
    {
      surname: 'Herscu',
      given_name: 'Misha',
      email: 'mishaherscu@gmail.com',
      phone_number: '413-320-6636',
      captain: 'yes',
      team_id: 1,
      user_id: 1
    },
    {
      surname: 'Cooper',
      given_name: 'Alex',
      email: 'cooper@gmail.com',
      phone_number: '555-555-5555',
      captain: 'no',
      team_id: 1,
      user_id: 2
    },
    {
      surname: 'Markette',
      given_name: 'Joshua',
      email: 'josh@gmail.com',
      phone_number: '111-111-1111',
      captain: 'yes',
      team_id: 2,
      user_id: 3
    },
    {
      surname: 'Taytay',
      given_name: 'Jake',
      email: 'jake@gmail.com',
      phone_number: '222-222-2222',
      captain: 'no',
      team_id: 2,
      user_id: 4
    }
  ]
)

Game.create(
  [
    {
      date: '2016-10-10',
      opponent: 'Blue',
      won: 'true',
      team_id: 1
    },
    {
      date: '2016-10-10',
      opponent: 'Green',
      won: 'false',
      team_id: 1
    }
  ]
)
