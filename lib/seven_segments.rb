require_relative 'Segment'
#addressing 7-segments in the traditional manner found on wikipedia where
#T =top          segment
#TR=top right    segment
#BR=bottom right segment
#B =bottom       segment
#BL=bottom left  segment
#TL=top left     segment
#M =middle       segment
SEGMENT_CONVERSION_MAP= {
        # T     TR    BR    B     BL    TL    M
    0 => [true ,true ,true ,true ,true ,true ,false],
    1 => [false,true ,true ,false,false,false,false],
    2 => [true ,true ,false,true ,true ,false,true ],
    3 => [true ,true ,true ,true ,false,false,true ],
    4 => [false,true ,true ,false,false,true ,true ],
    5 => [true ,false,true ,true ,false,true ,true ],
    6 => [true ,false,true ,true ,true ,true ,true ],
    7 => [true ,true ,true ,false,false,false,false],
    8 => [true ,true ,true ,true ,true ,true ,true ],
    9 => [true ,true ,true ,true ,false,true ,true ]
}
class SevenSegments
  
  def initialize(number,size = 2)

    @number=validate_and_set_number(number)
    @size=size.to_i
    @segments=SEGMENT_CONVERSION_MAP[@number]
    #size of my_lcd array is a minimym of 3 across by 5 down.  Size increases by one position
    #horizontally, and by two positions vertically.  
    @my_lcd = build_display
    light_segments
  end

  attr_reader :number

  def to_a
    @my_lcd.each_with_object([]) do |row,returnme|
      returnme << row.join
    end
  end

  private

  def validate_and_set_number(number)
    if valid?(number)
      number.to_i
    else
      raise ArgumentError, "#{number} has a non-digit value"
    end
  end

  def fill(segment)
    segment.describe_segment.each do |cell|
      @my_lcd[ cell[:x] ][ cell[:y] ] = cell[:char]
    end
  end

  def light_segments
    @segments.each_with_index { |is_lit,i|
      fill(create_segment(i)) if is_lit
    }
  end

  def height
    @size * 2 + 3
  end

  def create_segment(segment)
    Segment.new(@size,segment)
  end

  def valid?(number)
    return (number.size == 1 && number[/[0-9]/]) if number.is_a?(String)
    (0...9).include?(number)
  end
  
  def width
    @size + 2
  end

  def build_display
    Array.new((height)) { Array.new((width), " ") }
  end

end

