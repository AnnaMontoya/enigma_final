class CharacterMap
  def to_a
    ('a'..'z').to_a + (0..9).to_a.map(&:to_s) + [' ', '.', ',']
  end
end