class Segment
  attr_reader :x, :y, :direction

  def initialize(start_x,start_y, position)
    @x,@y,@position = start_x,start_y, position
  end

  def direction
    return :across if [0,3,6].include?(@position)
    :down
  end

end

