require './lib/message_decryptor'
require 'date'
require 'pry'

class Decrypt
  def decrypt(encrypted_filename, unencrypted_filename, key, date)
    message = File.read(encrypted_filename).strip
    date = Date.strptime(date, "%d%m%y")

    File.write(
      unencrypted_filename,
      MessageDecryptor.new.decrypt(message, key, date)
    )
  end
end

Decrypt.new.decrypt(ARGV[0], ARGV[1], ARGV[2], ARGV[3])