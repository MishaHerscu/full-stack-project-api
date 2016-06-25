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

%w(misha cooper josh jake jacob tyler).each do |name|
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
    },
    {
      name: 'Red'
    }
  ]
)

Player.create(
  [
    {
      surname: 'Herscu',
      given_name: 'Misha',
      email: 'misha@misha.com',
      phone_number: '413-320-6636',
      captain: 'yes',
      team_id: 1,
      user_id: 1
    },
    {
      surname: 'Cooper',
      given_name: 'Alex',
      email: 'cooper@gmail.com',
      phone_number: '111-111-1111',
      captain: 'no',
      team_id: 1,
      user_id: 2
    },
    {
      surname: 'Markette',
      given_name: 'Joshua',
      email: 'josh@gmail.com',
      phone_number: '222-222-2222',
      captain: 'yes',
      team_id: 2,
      user_id: 3
    },
    {
      surname: 'Taytay',
      given_name: 'Jake',
      email: 'jake@gmail.com',
      phone_number: '333-333-3333',
      captain: 'no',
      team_id: 2,
      user_id: 4
    },
    {
      surname: 'Luria',
      given_name: 'Jacob',
      email: 'jacob@gmail.com',
      phone_number: '444-444-4444',
      captain: 'yes',
      team_id: 3,
      user_id: 5
    },
    {
      surname: 'Chan',
      given_name: 'Tyler',
      email: 'Ty@gmail.com',
      phone_number: '555-555-5555',
      captain: 'no',
      team_id: 3,
      user_id: 6
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
      opponent: 'Weapon X',
      won: 'false',
      team_id: 2
    },
    {
      date: '2016-10-10',
      opponent: 'Green',
      won: 'false',
      team_id: 3
    },
    {
      date: '2016-10-10',
      opponent: 'Red',
      won: 'true',
      team_id: 4
    },
    {
      date: '2016-11-10',
      opponent: 'Green',
      won: 'false',
      team_id: 1
    },
    {
      date: '2016-11-10',
      opponent: 'Weapon X',
      won: 'false',
      team_id: 2
    },
    {
      date: '2016-11-10',
      opponent: 'Red',
      won: 'true',
      team_id: 3
    },
    {
      date: '2016-11-10',
      opponent: 'Blue',
      won: 'false',
      team_id: 4
    },
    {
      date: '2016-12-10',
      opponent: 'Red',
      won: 'false',
      team_id: 1
    },
    {
      date: '2016-12-10',
      opponent: 'Weapon X',
      won: 'true',
      team_id: 4
    }
  ]
)
