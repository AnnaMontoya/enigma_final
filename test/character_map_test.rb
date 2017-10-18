require './test/test_helper'
require 'pry'
require './lib/character_map'

class CharacterMapTest < Minitest::Test  
  def test_character_map
    character_map = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
      'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1',
      '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ','
    ]

    assert_equal character_map, CharacterMap.new.to_a
  end
end