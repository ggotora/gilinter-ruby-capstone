def check_file(file_name)
  file = File.open(file_name)
  line_num = 0
  until file.eof?
    first_white = file.gets[/^\s/]
    puts "Line #{line_num} has white space " if first_white
    line_num += 1
  end
end

check_file('test_data/bad_javascript.js')
