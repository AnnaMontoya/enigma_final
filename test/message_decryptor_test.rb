require './test/test_helper'
require 'pry'
require './lib/message_decryptor'
require 'date'

class MessageDecryptorTest < Minitest::Test  
  def test_can_decrypt_a_short_message
    key = "12345"
    date = Date.new(2000, 2, 3)
    decrypted_message = MessageDecryptor.new.decrypt("z5 u", key, date)
    assert_equal "nico", decrypted_message
  end

  def test_can_decrypt_a_short_message_2
    key = "17533"
    date = Date.today
    decrypted_message = MessageDecryptor.new.decrypt("2d7o99fr,kz", key, date)
    assert_equal "hello world", decrypted_message
  end

  def test_can_decrypt_a_full_message
    key = "62039"
    date = Date.new(2002, 12, 9)
    decrypted_message = MessageDecryptor.new.decrypt("b fsyah09h", key, date)
    assert_equal "nico lewis", decrypted_message
  end

  # edge case test
  def test_can_decrypt_empty_message
    key = "62039"
    date = Date.new(2002, 12, 9)
    decrypted_message = MessageDecryptor.new.decrypt("", key, date)
    assert decrypted_message.empty?
  end

  # edge case test
  def test_invalid_key_returns_empty_string
    key = "234"
    date = Date.new(2002, 12, 9)
    decrypted_message = MessageDecryptor.new.decrypt("Hello world", key, date)
    assert decrypted_message.empty?
  end
end