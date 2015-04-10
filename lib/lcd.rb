

class LCD

  require_relative 'seven_segments'

  def initialize(digits,size=2)
    @digits = digits.map {|digit| SevenSegments.new(digit,size) }
    raise ArgumentError, "#{digits} has a non-digit value" unless valid_values?
  end

  def to_s
    "".tap do |printout|
      @digits[0].height.times do |row|
        printout << @digits.map {|segment| segment.to_s(row) }.join + "\n"
      end
    end
  end

  def valid_values?
    @digits.any? { |d| !!SEGMENT_MAP[d.number] }
  end

end

