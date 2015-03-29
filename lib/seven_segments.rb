require_relative 'Segment'
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
    @digit=SEGMENTS[@number]
    #size of my_lcd array is a minimym of 3 across by 5 down.  Size increases by one position
    #horizontally, and by two positions vertically.  
    @my_lcd = build_display
    light_segments
  end

  def lcd_size
    @my_lcd.size()
  end

  def to_s(row)
    @my_lcd[row].join + " "
  end

  def fill(segment)
   # segment.fill_range.each do |cell|
   #   @my_lcd[cell[0],cell[1]]= cell[2]
   # end
    if(segment.direction == :across) then
      @size.times { |counter|  @my_lcd[segment.x][segment.y+counter] = "-" }
    else
      @size.times { |counter|  @my_lcd[segment.x+counter][segment.y] = "|" }
    end
  end

  def create_segment(segment)
    Segment.new(@size,segment)
  end


  def light_segments
    @digit.each_with_index { |is_lit,i|
      fill(create_segment(i)) if is_lit
    }
  end

  private

  def build_display
    Array.new((@size*2+3)) { Array.new((@size+2), " ") }
  end

end

