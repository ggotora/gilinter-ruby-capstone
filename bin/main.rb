require_relative '../lib/test'

run = Tests.new('test_data/bad_js.js')
run.error_messages
