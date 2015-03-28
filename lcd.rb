#!/usr/bin/env ruby

require_relative 'lib/print_all'

size=2 

if ARGV.include?("-s")  
  index=ARGV.index "-s"
  if ARGV[index+1]   
    size=ARGV[index+1].to_i
  else
    fail "-s provided, but no value provided after it" 
  end
end
if ARGV[-1].nil?  
  fail "no argument provided" 
end

arg_numbers= ARGV[-1].chars

PrintAll.new(arg_numbers,size)

#lcd= Seven_segments.new(ARGV[-1],size)
