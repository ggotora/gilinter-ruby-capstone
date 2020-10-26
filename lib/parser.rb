require 'strscan'

class Parser
  def initialize(file_path)
    @file = File.open(file_path)
    # test_data = @file.readline
    # @buffer = StringScanner.new(test_data)
    @errors = Hash.new(0)
  end

  def line
    @file.gets
  end

  def line_length_error?
    @errors['line_length_errors'] += 1 if line.length > 80
    @errors
  end

  def string_declaration_error?
    @errors['string_declaration_errors'] += 1 if line =~ /new String()/
    @errors
  end

  def number_declaration_error?
    @errors['number_declaration_errors'] += 1  if line =~ /new Number()/
    @errors
  end

  # def number_declaration_error?
  #   @errors['number_declaration_errors'] += 1 if (line =~ /new Number/).instance_of? Integer
  #   @errors
  # end

  def indent_error?
    @errors['indent_errors'] += 1 if @buffer.peek(1) == ' '
    @errors
  end
   
  def check_all_lines
    line_num = 0
    until @file.eof?
      line_length_error?
      string_declaration_error?
      number_declaration_error?
      puts line_num
      line_num += 1
    end
    puts @errors
  end
end

run = Parser.new('test_data/bad_js.js')
puts run.check_all_lines


