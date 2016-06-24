curl --include --request GET http://localhost:3000/games

curl --include --request PATCH http://localhost:3000/games/1 \
--header "Content-Type: application/json" \
--data '{
    "new_game_details": {
      "date": "2016-12-10",
      "opponent": "2",
      "won": "false"
    }
}'
