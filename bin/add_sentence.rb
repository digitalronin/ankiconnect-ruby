#!/usr/bin/env ruby

require "./lib/ankiconnect"

side1 = ARGV.shift
side2 = ARGV.shift

pp Sentence.new(side1: side1, side2: side2).create

