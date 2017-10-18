class KeyGenerator
  def generate
    Random.rand(99999).to_s.rjust(5, "0")
  end

  def rotations(key)
    return [] unless key =~ /^\d{5}$/
    [key[0..1], key[1..2], key[2..3], key[3..4]].map(&:to_i)
  end
end