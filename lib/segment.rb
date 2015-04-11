class Segment

  def initialize(size, position)
    @size,@position = size, position
    unless position_valid?
      raise ArgumentError, "segment number #{@position} out of range" 
    end
    unless size_valid?
      raise ArgumentError, "segment number #{@size} out of range" 
    end
  end

  def direction
    return :across if [0,3,6].include?(@position)
    :down
  end

  def fill_segment
    returnme = []
    if(direction == :across) then
      @size.times { |counter|  returnme << {x: x, y: y+counter, char: "-"} }
    else
      @size.times { |counter|  returnme << { x: x+counter,y: y, char: "|"} }
    end
    returnme
  end

  def y
    segment_start_x = { 0 => 1,
                          1 => @size + 1,
                          2 => @size + 1,
                          3 => 1,
                          4 => 0,
                          5 => 0,
                          6 => 1
                        }
    segment_start_x[@position]
  end

  def x
    segment_start_y = { 0 => 0,
                        1 => 1,
                        2 => @size + 2,
                        3 => @size * 2 + 2,
                        4 => @size +2,
                        5 => 1 ,
                        6 => @size + 1 
                      }
    segment_start_y[@position]
  end

  private

  def position_valid?
    (0..6).include?(@position) 
  end

  def size_valid?
    @size > 0
  end

end

