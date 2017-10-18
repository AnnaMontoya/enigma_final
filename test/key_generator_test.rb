require './test/test_helper'
require 'pry'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test  
	def test_can_generate_a_5_digit_key
		assert KeyGenerator.new.generate =~ /^\d{5}$/
	end

	def test_generate_returns_random_key
		assert KeyGenerator.new.generate != KeyGenerator.new.generate
	end

	def test_builds_rotations_from_key
		key = "41521"
		rotations = KeyGenerator.new.rotations(key)
		assert 4, rotations.count
		assert_equal 41, rotations[0]
		assert_equal 15, rotations[1]
		assert_equal 52, rotations[2]
		assert_equal 21, rotations[3]

		# assert_equal [41, 15, 52, 21], rotations
	end

	def test_returns_empty_rotations_for_invalid_key
		assert KeyGenerator.new.rotations("a").empty?
	end
end