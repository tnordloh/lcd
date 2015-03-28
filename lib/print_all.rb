

class PrintAll

  require_relative 'seven_segments'

  def initialize(digits,size=2)
    @digits = digits.collect {|digit| SevenSegments.new(digit,size) }
    @raw_digits=digits
    raise ArgumentError, "#{digits} has a non-digit value" unless valid_values?
    print_all
  end

  def print_all
    @digits[0].lcd_size.times {|row|
      @digits.each {|segment| segment.print_row(row) }
      puts
    }
  end

  def valid_values?
    !!(@raw_digits.join !~ /[^0-9]/)
  end

end

