class ReadFile
  def initialize(path)
    @path = path
  end

  def line
    File.open(@path, 'r', &:readline)
  end

  def line_length_error?
    @errors['line_length_errors'] += 1 if line.length > 80
    @errors
  end

  def comparison_error?
    @errors['comparison'] += 1 if line.include? '=='
    @errors
  end

  def all_test
    File.open(@path, 'r') do
      line_length_error?
    end
  end
end

run = ReadFile.new('test_data/bad_js.js')
puts run.all_test
