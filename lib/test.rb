require_relative 'parser'

# parser = Parser.new('test_data/bad_js.js')
# puts parser

class Tests
  def initialize(path)
    @path = path
    @run = Parser.new(path)
  end
   def error_messages
    total_errors = @run.all_tests.values.inject(0) { |a, b| a + b }
   end
end

test = Tests.new('test_data/bad_js.js')
test.error_messages