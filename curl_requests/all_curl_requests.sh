#
# Games
#

# get all
curl --include --request GET http://localhost:3000/games

# failing PATCH - no token
curl --include --request PATCH http://localhost:3000/games/1 \
--header "Content-Type: application/json" \
--data '{
    "new_game_details": {
      "date": "2016-12-10",
      "opponent": "2",
      "won": "false"
    }
}'

# failing PATCH - wrong token
curl --include --request PATCH http://localhost:3000/games/1 \
--header "Content-Type: application/json" \
--header "authToken: aof1vns3fdoj4nv4adfovkna4d" \
--data '{
    "new_game_details": {
      "date": "2016-12-10",
      "opponent": "2",
      "won": "false"
    }
}'

# successful PATCH - correct token
curl --include --request PATCH http://localhost:3000/games/1 \
--header "Content-Type: application/json" \
--header "authToken: 8cc8c6813fad19956778b93a9611a8fe" \
--data '{
    "new_game_details": {
      "date": "2016-12-10",
      "opponent": "2",
      "won": "false"
    }
}'

# successful GETs
curl --include --request GET https://ironsidegoaltimate.herokuapp.com/games
curl --include --request GET https://ironsidegoaltimate.herokuapp.com/teams
curl --include --request GET https://ironsidegoaltimate.herokuapp.com/players

# correct POST still fails (probably because no current_user)
curl --include --request POST https://ironsidegoaltimate.herokuapp.com/players \
--header "Content-Type: application/json" \
--header "authToken: 3ba1dab9a1b51d893a033472bcd7c46a" \
--data '{
    "player": {
      "surname": "hersc",
      "given_name": "mish",
      "email": "hersc@herc",
      "phone_number": "999-999-9999",
      "captain": "no",
      "team_id": "1",
      "user_id": "1"
    }
}'
