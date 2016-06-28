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

%w(misha cooper josh jake jacob tyler mh mhh).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: '123',
               password_confirmation: '123')
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
    },
    {
      surname: 'mh',
      given_name: 'mh',
      email: 'mh@mh.com',
      phone_number: '666-666-6666',
      captain: 'no',
      team_id: 1,
      user_id: 7
    },
    {
      surname: 'mhh',
      given_name: 'mhh',
      email: 'mhh@mhh.com',
      phone_number: '777-777-7777',
      captain: 'no',
      team_id: 2,
      user_id: 8
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

Goal.create(
  [
    {
      player_id: 1,
      game_id: 1
    },
    {
      player_id: 1,
      game_id: 2
    },
    {
      player_id: 1,
      game_id: 3
    },
    {
      player_id: 2,
      game_id: 1
    },
    {
      player_id: 2,
      game_id: 3
    },
    {
      player_id: 3,
      game_id: 4
    },
    {
      player_id: 3,
      game_id: 3
    },
    {
      player_id: 4,
      game_id: 6
    },
    {
      player_id: 4,
      game_id: 2
    },
    {
      player_id: 5,
      game_id: 1
    },
    {
      player_id: 5,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 3
    },
    {
      player_id: 7,
      game_id: 4
    },
    {
      player_id: 7,
      game_id: 4
    },
    {
      player_id: 1,
      game_id: 9
    },
    {
      player_id: 2,
      game_id: 8
    },
    {
      player_id: 2,
      game_id: 7
    },
    {
      player_id: 2,
      game_id: 2
    },
    {
      player_id: 1,
      game_id: 6
    },
    {
      player_id: 1,
      game_id: 4
    },
    {
      player_id: 1,
      game_id: 5
    }
  ]
)

Assist.create(
  [
    {
      player_id: 1,
      game_id: 1
    },
    {
      player_id: 1,
      game_id: 2
    },
    {
      player_id: 1,
      game_id: 3
    },
    {
      player_id: 2,
      game_id: 1
    },
    {
      player_id: 2,
      game_id: 3
    },
    {
      player_id: 3,
      game_id: 4
    },
    {
      player_id: 3,
      game_id: 3
    },
    {
      player_id: 4,
      game_id: 6
    },
    {
      player_id: 4,
      game_id: 2
    },
    {
      player_id: 5,
      game_id: 1
    },
    {
      player_id: 5,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 2
    },
    {
      player_id: 6,
      game_id: 3
    },
    {
      player_id: 7,
      game_id: 4
    },
    {
      player_id: 7,
      game_id: 4
    },
    {
      player_id: 1,
      game_id: 9
    },
    {
      player_id: 2,
      game_id: 8
    },
    {
      player_id: 2,
      game_id: 7
    },
    {
      player_id: 2,
      game_id: 2
    },
    {
      player_id: 1,
      game_id: 6
    },
    {
      player_id: 1,
      game_id: 4
    },
    {
      player_id: 1,
      game_id: 5
    }
  ]
)
