#!/usr/bin/env ruby

class Starting_point
  attr_reader :x, :y, :direction
  def initialize(start_x,start_y, direction)
    @x,@y,@direction = start_x,start_y, direction
  end
end

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

class Seven_segments
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
    if (size<=0) then
      fail "size is 0 or less; invalid"
    end
    if ((0..9).include? @number) then
    else
      fail "number not between 0 and 9"
    end
    @size=size.to_i
    segments=[]
                # T  TR  BR  B   BL  TL  M
    segments << [true ,true ,true ,true ,true ,true ,false]
    segments << [false,true ,true ,false,false,false,false]
    segments << [true ,true ,false,true ,true ,false,true ]
    segments << [true ,true ,true ,true ,false,false,true ]
    segments << [false,true ,true ,false,false,true ,true ]
    segments << [true ,false,true ,true ,false,true ,true ]
    segments << [true ,false,true ,true ,true ,true ,true ]
    segments << [true ,true ,true ,false,false,false,false]
    segments << [true ,true ,true ,true ,true ,true ,true ]
    segments << [true ,true ,true ,true ,false,true ,true ]
    @current_segment=segments[@number]
    #size of my_lcd array is a minimym of 3 across by 5 down.  Size increases by one position
    #horizontally, and by two positions vertically.  
    @my_lcd = Array.new((@size*2+3)) { Array.new((@size+2), " ") }
    light_segments
  end
  def lcd_size
    @my_lcd.size()
  end
  def print_row(row)
    print @my_lcd[row].join
    print " "
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
    case this_segment
    when 0
     Starting_point.new(0,1,:across) #segment a (top)
    when 1
     Starting_point.new(1, @size+1 ,:down) #segment b (TR)
    when 2
     Starting_point.new( @size+2 , @size+1 ,:down) #c (BR)
    when 3
     Starting_point.new( @size*2+2,1,:across) #d (B)
    when 4
     Starting_point.new(@size+2 ,0,:down) #e (BL)
    when 5
     Starting_point.new(1,0,:down) #e (TL)
    when 6
     Starting_point.new(@size+1,1,:across) #e (M)
    else
      fail "segment number #{this_segment} out of range"
    end
  end
  def light_segments
    @current_segment.each_with_index { |this_segment,i|
      if(this_segment) then
        fill(find_segment_start(i))
      end
    }
  end
end
size=2 

if ARGV.include?("-s")  
  index=ARGV.index "-s"
  if ARGV[index+1]   
    size=ARGV[index+1].to_i
  else
    fail "-s provided, but no value provided after it" 
  end
end
if ARGV[-1].nil?  
  fail "no argument provided" 
end

arg_numbers= ARGV[-1].chars

Printall.new(arg_numbers,size)

#lcd= Seven_segments.new(ARGV[-1],size)
