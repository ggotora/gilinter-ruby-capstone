require 'strscan'

class Parser
  def initialize(file_path)
    @file = File.open(file_path)
    test_data = @file.readline
    @buffer = StringScanner.new(test_data)
    @errors = Hash.new(0)
  end

  def line
    @file.gets.chomp
  end

  def line_length_error?
    # p"#{line} = #{line.length}"
    @errors['line_length_errors'] += 1 if line.length > 80
    @errors
  end


  def indent_error?
    @errors['indent_errors'] += 1 if @buffer.peek(1) == ' '
    @errors
  end

  def check_all_lines
    line_num = 0
    until @file.eof?
      declaration_error?
      line_length_error?
      string_declaration_error?
      indent_error?
      line_num += 1
    end
    puts @errors
    file.close()
  end
end

run = Parser.new('test_data/bad_js.js')
# run.check_all_lines
puts run.check_all_lines
puts run.declaration_error?

