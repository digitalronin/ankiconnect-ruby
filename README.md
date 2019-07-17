# Ruby library to interact with localhost [ankiconnect] webserver

## Ruby script

./post.rb "テスト" "てすと" "This is a test"

## Calling the API

curl localhost:8765 -X POST -d "{\"action\": \"deckNames\", \"version\": 6}"

curl localhost:8765 -X POST -d "{\"action\": \"deckNamesAndIds\", \"version\": 6}"

curl localhost:8765 -X POST -H "Content-Type: application/json; charset=utf-8" -d " { \"action\": \"guiBrowse\", \"version\": 6, \"params\": { \"query\": \"水泳\" } }"

curl localhost:8765 -X POST -H "Content-Type: application/json; charset=utf-8" -d " { \"action\": \"findCards\", \"version\": 6, \"params\": { \"query\": \"水泳\" } }"

curl localhost:8765 -X POST -H "Content-Type: application/json; charset=utf-8" -d " { \"action\": \"cardsInfo\", \"version\": 6, \"params\": { \"cards\": [1563396000385] } } "

curl localhost:8765 -X POST -H "Content-Type: application/json; charset=utf-8" -d "{ \"action\": \"addNote\", \"version\": 6, \"params\": { \"note\": { \"deckName\": \"Japanese words\", \"modelName\": \"Basic (and reversed card)\", \"fields\": { \"Front\": \"これは<div>テストです</div>\", \"Back\": \"This is test back\" }, \"options\": { \"allowDuplicate\": false }, \"tags\": [] } } }"

[ankiconnect]: https://foosoft.net/projects/anki-connect/
