#!/usr/bin/env ruby

require "./lib/ankiconnect"

csv_file = ARGV.shift

File.readlines(csv_file).each do |line|
  side1, side2 = line.split(",")
  pp Sentence.new(side1: side1, side2: side2).create.body
end
