require './test/test_helper'
require 'pry'
require './lib/offset_generator'
require 'date'

class OffsetGeneratorTest < Minitest::Test  
  def test_generate_returns_offset_from_provided_date
    key = "41521"
    date = Date.new(2015, 3, 2)
    offset = OffsetGenerator.new.generate(key, date)
    assert_equal 4, offset.count
    assert_equal 50, offset[0]
    assert_equal 17, offset[1]
    assert_equal 54, offset[2]
    assert_equal 26, offset[3]
  end

  def test_generate_turns_empty_array_for_invalid_key
    assert OffsetGenerator.new.generate("asd", Date.today).empty?
  end
end