require './lib/offset_generator'
require './lib/character_map'

class MessageDecryptor
  CHARACTER_MAP = CharacterMap.new.to_a
  

  def decrypt(encrypted_message, key, date)
    offsets = OffsetGenerator.new.generate(key, date)
    return [] if offsets.empty?

    encrypted_message_characters = encrypted_message.chars
    encrypted_message_characters.map.with_index do |character, i|
      offset = CHARACTER_MAP.index(character) - offsets[i % 4]
      CHARACTER_MAP.rotate(offset).first
    end.join
  end
end