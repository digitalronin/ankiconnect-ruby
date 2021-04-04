#!/usr/bin/env ruby

require "./lib/ankiconnect"

def create_card(line)
  kanji, kana, english = line.split("\t")
  pp Card.new(kanji: kanji, kana: kana, english: english).create.body
end

tsv_file = ARGV.shift

File.readlines(tsv_file).each do |line|
  create_card line
end
