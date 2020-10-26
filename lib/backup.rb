class TestData
  def initialize(file)
    @file = file
  end

  def open_file
    File.open(@file)
  end

  def read_file
    open_file.read
  end

  def close_file
    open_file.close
  end
end

class Errors
  attr_reader :tags

  def initialize(file)
    require 'strscan'
    @file = TestData.new(file)
    test_data = @file.read_file
    @buffer = StringScanner.new(test_data)
    @errors = Hash.new(0)
    # parse
  end
  

  def space
    
      @errors['indent_error'] += 1 if @buffer.scan(/^\s/)
      puts @errors
   
  end
end
