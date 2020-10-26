require 'colorize'

require_relative 'parser'

# parser = Parser.new('test_data/bad_js.js')
# puts parser

class Tests
  def initialize(path)
    @path = path
    @run = Parser.new(path)
  end

  def error_messages
    err_hash = @run.all_tests
    total_errors = err_hash.values.inject(:+)
    puts
    puts("#{total_errors} offenses detected".colorize(:red))
    puts
    puts(err_hash.map { |k, v| "#{v} : #{k}".colorize(:yellow) })
    puts
  end
end

# test = Tests.new('test_data/bad_js.js')
# test.error_messages
