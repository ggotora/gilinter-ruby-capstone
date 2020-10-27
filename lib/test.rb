# rubocop: disable Metrics/CyclomaticComplexity, Metrics/MethodLength
require 'colorize'

require_relative 'parser'

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
    err_hash.map do |k, v|
      if k == 'string_declaration_error'
        puts "#{v} #{k} detected : Best Practice is to use \"\" instead of new String()".colorize(:yellow)
      end

      if k == 'function_declaration_error'
        puts "#{v} #{k} detected : Best Practice is to use function (){} instead of new Function()".colorize(:yellow)
      end

      if k == 'length_error'
        puts "#{v} #{k} detected : Best Practice is line length should be less than 80".colorize(:yellow)
      end

      if k == 'comparison_error'
        puts "#{v} #{k} detected : Best Practice is to use === instead of == ".colorize(:yellow)
      end

      if k == 'object_declaration_error'
        puts "#{v} #{k} detected : Best Practice is to use {} instead of new Object()".colorize(:yellow)
      end

      if k == 'number_declaration_error'
        puts "#{v} #{k} detected : Best Practice is to use 0 instead of new Number()".colorize(:yellow)
      end
    end
    puts
  end
end

# rubocop: enable Metrics/CyclomaticComplexity, Metrics/MethodLength
