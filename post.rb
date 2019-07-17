#!/usr/bin/env ruby

require "./lib/ankiconnect"

kanji = ARGV.shift
kana = ARGV.shift
english = ARGV.shift

pp Card.new(kanji: kanji, kana: kana, english: english).create
