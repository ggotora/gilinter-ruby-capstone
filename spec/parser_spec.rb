require_relative '../lib/parser'

describe Parser do
  let(:run_test) { Parser.new('test_data/bad_js.js') }
  describe '#length_error' do
    it 'console.log(jsjsuahajaiahagabagahahwedgshehsjaso93837320398373hgdfabdjshsudhsgef4hsbgdvsfgwjs)
     should return {length_error => 1}' do
      expect(run_test.length_error('console.log(jsjsuahajaiahagabagahahwedgshehsjaso93837320398373hgdfabdjshsudhsgef
        4hsbgdvsfgwjs)')).to eql({ 'length_error' => 1 })
    end
  end

  describe '#comparison_error' do
    it 'console.log(3 == 4) should return {comparison_error => 1}' do
      expect(run_test.comparison_error('console.log(3 == 4)')).to eql({ 'comparison_error' => 1 })
    end
  end

  describe '#string_declaration_error' do
    it 'string_declaration_error(var d = new String(\'John\') should return {comparison_error => 1}' do
      expect(run_test.string_declaration_error('var d = new String')).to eql({ 'string_declaration_error' => 1 })
    end
  end

  describe '#number_declaration_error' do
    it 'string_declaration_error(var d = new String(\'John\') should return { number_declaration_error => 1 }' do
      expect(run_test.number_declaration_error('var d = new Number')).to eql({ 'number_declaration_error' => 1 })
    end
  end

  describe '#object_declaration_error' do
    it 'object_declaration_error(\'var d = new Object() ; let f = new Object()\')
    should return {comparison_error => 1}' do
      expect(run_test.object_declaration_error('var d = new Object()')).to eql({ 'object_declaration_error' => 1 })
    end
  end
end
