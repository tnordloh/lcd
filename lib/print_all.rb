class Printall
  def initialize(digits,size=2)
    @digits = digits.collect {|digit| Seven_segments.new(digit,size) }
    print_all
  end
  def print_all
    @digits[0].lcd_size.times {|row|
      @digits.each {|segment| segment.print_row(row) }
      puts
    }
  end
end

