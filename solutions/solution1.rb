#!/usr/bin/env ruby
# encoding: utf-8

input = STDIN.read.split("\n")

code = input[0]
tries_count = (input[1]).to_i
tries = input[2,tries_count]

#puts code
#puts tries_count
#puts tries

code_a = code.split(//)
code_h = Hash[code_a.map {|x| [x, 1]}]
#puts code_h
tries.each do |t|
  total_right = 0
  missed_right = 0
  t.each_char.with_index do |c, i|
    if c == code[i]
      total_right += 1
    else
      missed_right += 1 if code_h.has_key?(c)
    end
  end
  puts "#{total_right} #{missed_right}"
end
