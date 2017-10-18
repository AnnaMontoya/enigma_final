require './test/test_helper'
require 'pry'
require './lib/message_encryptor'
require 'date'

class MessageEncryptorTest < Minitest::Test  
  def test_can_encrypt_a_short_message
    key = "12345"
    date = Date.new(2000, 2, 3)
    encrypted_message = MessageEncryptor.new.encrypt("nico ..end..", key, date)
    assert_equal "z5 ujv6kz06e", encrypted_message
  end

  def test_can_encrypt_a_full_message
    key = "62039"
    date = Date.new(2002, 12, 9)
    encrypted_message = MessageEncryptor.new.encrypt("nico lewis ..end..", key, date)
    assert_equal "b fsyah09hacz6qhz0", encrypted_message
  end

  # edge case test
  def test_can_encrypt_empty_message
    key = "62039"
    date = Date.new(2002, 12, 9)
    encrypted_message = MessageEncryptor.new.encrypt("", key, date)
    assert encrypted_message.empty?
  end

  # edge case test
  def test_invalid_key_returns_empty_string
    key = "234"
    date = Date.new(2002, 12, 9)
    encrypted_message = MessageEncryptor.new.encrypt("hello world", key, date)
    assert encrypted_message.empty?
  end
end