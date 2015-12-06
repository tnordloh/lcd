

class LCD

  require_relative 'seven_segments'

  def initialize(digits,size=2)
    @digits = digits.map {|digit| SevenSegments.new(digit,size) }
  end

  def to_s
    @digits.each_with_object([]) do |digit,accumulator|
      accumulator << digit.to_a
    end.transpose
       .each_with_object("") do |t,a|
      a << (t.join " " ) + "\n"
    end
  end


end

