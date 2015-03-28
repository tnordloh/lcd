

class LCD

  require_relative 'seven_segments'

  def initialize(digits,size=2)
    @digits = digits.map {|digit| SevenSegments.new(digit,size) }
    @raw_digits=digits
    raise ArgumentError, "#{digits} has a non-digit value" unless valid_values?
  end

  def to_s
    printout = ""
    @digits[0].lcd_size.times {|row|
      printout << @digits.map {|segment| segment.to_s(row) }.join + "\n"
    }
    printout
  end

  def valid_values?
    !!(@raw_digits.join !~ /[^0-9]/)
  end

end
