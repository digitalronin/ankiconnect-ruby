#!/usr/bin/env ruby

require "uri"
require "net/http"
require "json"

class Card
  attr_reader :kanji, :kana, :english

  def initialize(arg)
    @kanji = arg.fetch(:kanji)
    @kana = arg.fetch(:kana)
    @english = arg.fetch(:english)
  end

  def create
    post(front, english)
  end

  private

  def front
    kana.to_s == "" ? kanji : %[#{kanji}<div>#{kana}</div>]
  end

  def post(front, back)
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
            "Front" => front,
            "Back" => back
          },
          "options" => { "allowDuplicate" => false },
          "tags" => ["ruby"]
        }
      }
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    res
  end
end

kanji = ARGV.shift
kana = ARGV.shift
english = ARGV.shift

pp Card.new(kanji: kanji, kana: kana, english: english).create
