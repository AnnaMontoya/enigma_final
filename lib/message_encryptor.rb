require './lib/offset_generator'
require './lib/character_map'

class MessageEncryptor
  CHARACTER_MAP = CharacterMap.new.to_a

  def encrypt(message, key, date)
    offsets = OffsetGenerator.new.generate(key, date)
    return [] if offsets.empty?

    message_characters = message.chars
    message_characters.map.with_index do |character, i|
      offset = CHARACTER_MAP.index(character) + offsets[i % 4]
      CHARACTER_MAP.rotate(offset).first
    end.join
  end
end
