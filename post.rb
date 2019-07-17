#!/usr/bin/env ruby

require "uri"
require "net/http"
require "json"
require "./lib/card"

kanji = ARGV.shift
kana = ARGV.shift
english = ARGV.shift

pp Card.new(kanji: kanji, kana: kana, english: english).create
