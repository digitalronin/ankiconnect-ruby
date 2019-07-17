#!/usr/bin/env ruby

require "uri"
require "net/http"
require "json"

uri = URI('http://localhost:8765')
req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json; charset=utf-8')

req.body = {
  "action" => "addNote",
  "version" => 6,
  "params" => {
    "note" => {
      "deckName" => "Japanese words",
      "modelName" => "Basic (and reversed card)",
      "fields" => {
        "Front" => "これは<div>テストです</div>",
        "Back" => "This is test back"
      },
      "options" => { "allowDuplicate" => false },
      "tags" => []
    }
  }
}.to_json

res = Net::HTTP.start(uri.hostname, uri.port) do |http|
  http.request(req)
end

pp res
