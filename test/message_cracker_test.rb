require './test/test_helper'
require 'pry'
require './lib/message_cracker'
require 'date'

class MessageCrackerTest < Minitest::Test
  def test_crack_decodes_encrypted_message
    skip
    date = Date.new(2000, 2, 3)
    encrypted_message = "z5 ujv6kz06e"
    assert_equal "nico ..end..", MessageCracker.new.crack(encrypted_message, date)
  end
end