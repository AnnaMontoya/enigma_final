require './lib/offset_generator'
require './lib/character_map'
require './lib/message_decryptor'


class MessageCracker
  CHARACTER_MAP = CharacterMap.new.to_a

  def crack(encrypted_message, date)
    known_suffix = "..end.."

    # "nico ..end.."
    suffix_index = encrypted_message.chars.count - known_suffix.chars.count
    rotation_index = suffix_index % 4
    encrypted_dot = encrypted_message.chars[suffix_index]
    dot_index = CHARACTER_MAP.index(".")
    encrypted_dot_index = CHARACTER_MAP.index(encrypted_dot)
    date_offset = OffsetGenerator.new.date_offset(date)
    offset = encrypted_dot_index - dot_index
  end
end

