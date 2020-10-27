class Parser
  def initialize(file_path)
    @file_path = file_path
    @errors = Hash.new(0)
    @line_arr = []
  end

  def lines
    File.open(@file_path).each { |line| @line_arr << line }
    @line_arr
  end

  def length_error(line)
    @errors['length_error'] += 1 if line.size > 80
    @errors
  end

  def comparison_error(line)
    @errors['comparison_error'] += 1 if line.include? '=='
    @errors
  end

  def string_declaration_error(line)
    @errors['string_declaration_error'] += 1 if line.include? 'new String'
    @errors
  end

  def object_declaration_error(line)
    @errors['object_declaration_error'] += 1 if line.include? 'new Object'
    @errors
  end

  def number_declaration_error(line)
    @errors['number_declaration_error'] += 1 if line.include? 'new Number'
    @errors
  end

  def function_declaration_error(line)
    @errors['function_declaration_error'] += 1 if line.include? 'new Function'
    @errors
  end

  def all_tests
    lines.each do |line|
      function_declaration_error(line)
      length_error(line)
      comparison_error(line)
      string_declaration_error(line)
      number_declaration_error(line)
      object_declaration_error(line)
    end
    @errors
  end
end


