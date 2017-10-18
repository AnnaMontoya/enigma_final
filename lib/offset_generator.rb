require './lib/key_generator'

class OffsetGenerator
  def generate(key, date)
    rotations = KeyGenerator.new.rotations(key)
    date_offset = date_offset(date).chars.map(&:to_i)

    rotations.map.with_index do |rotation, i|
      rotation + date_offset[i]
    end
  end

  def date_offset(date)
    puts date.strftime("%d%m%y")
    (date.strftime("%d%m%y").to_i ** 2).to_s[-4..-1]
  end
end