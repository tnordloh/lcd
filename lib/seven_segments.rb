require_relative 'starting_point'
SEGMENTS=[]
                # T  TR  BR  B   BL  TL  M
    SEGMENTS << [true ,true ,true ,true ,true ,true ,false]
    SEGMENTS << [false,true ,true ,false,false,false,false]
    SEGMENTS << [true ,true ,false,true ,true ,false,true ]
    SEGMENTS << [true ,true ,true ,true ,false,false,true ]
    SEGMENTS << [false,true ,true ,false,false,true ,true ]
    SEGMENTS << [true ,false,true ,true ,false,true ,true ]
    SEGMENTS << [true ,false,true ,true ,true ,true ,true ]
    SEGMENTS << [true ,true ,true ,false,false,false,false]
    SEGMENTS << [true ,true ,true ,true ,true ,true ,true ]
    SEGMENTS << [true ,true ,true ,true ,false,true ,true ]
class SevenSegments
  #addressing 7-segments in the traditional manner found on wikipedia where
  #T =top          segment
  #TR=top right    segment
  #BR=bottom right segment
  #B =bottom       segment
  #BL=bottom left  segment
  #TL=top left     segment
  #M =middle       segment
  
  def initialize(number,size = 2)
    @number=number.to_i
    @size=size.to_i
    @current_segment=SEGMENTS[@number]
    #size of my_lcd array is a minimym of 3 across by 5 down.  Size increases by one position
    #horizontally, and by two positions vertically.  
    @my_lcd = build_display
    light_segments
  end

  def build_display
    Array.new((@size*2+3)) { Array.new((@size+2), " ") }
  end

  def lcd_size
    @my_lcd.size()
  end

  def to_s(row)
    @my_lcd[row].join + " "
  end

  def fill(direction)
    if(direction.direction == :across) then
      @size.times { |counter|  @my_lcd[direction.x][direction.y+counter] = "-" }
    else
      @size.times { |counter|  @my_lcd[direction.x+counter][direction.y] = "|" }
    end
  end

  def find_segment_start(this_segment)
    ## James says this probably should be in an array
    fail "segment number #{this_segment} out of range" unless (0..6).include?(this_segment)
    temp_x = x_starting_point(this_segment)
    temp_y = y_starting_point(this_segment)
    temp_direction = direction(this_segment)
    StartingPoint.new(temp_x,temp_y,temp_direction)
  end

  def direction(segment)
    return :across if [0,3,6].include?(segment)
    :down
  end

  def y_starting_point(segment)
    points = { 0 => 1,
               1 => @size + 1,
               2 => @size + 1,
               3 => 1,
               4 => 0,
               5 => 0,
               6 => 1
    }
    points[segment]
  end

  def x_starting_point(segment)
    points = {0 => 0,
             1 => 1,
             2 => @size + 2,
             3 => @size * 2 + 2,
             4 => @size +2,
             5 => 1 ,
             6 => @size + 1 }
    points[segment]
  end

  def light_segments
    @current_segment.each_with_index { |this_segment,i|
      if(this_segment) then
        fill(find_segment_start(i))
      end
    }
  end
end

