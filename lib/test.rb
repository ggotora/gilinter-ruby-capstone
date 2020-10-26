require 'strscan'

s = StringScanner.new(' test string')
puts s.peek(1)          # => "test st"
puts s.peek(7)          # => "test st"

