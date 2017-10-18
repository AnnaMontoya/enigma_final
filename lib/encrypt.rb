require './lib/message_encryptor'
require 'date'

class Encrypt
  def encrypt(unencrypted_filename, encrypted_filename)
    key = KeyGenerator.new.generate
    date = Date.today
    message = File.read(unencrypted_filename)
    File.write(
      encrypted_filename,
      MessageEncryptor.new.encrypt(message, key, date)
    )

    puts "Encrypted with key #{key} and date #{date.strftime("%d%m%y")}"
  end
end

Encrypt.new.encrypt(ARGV[0], ARGV[1])