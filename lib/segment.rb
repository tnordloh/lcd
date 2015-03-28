class Segment

  def initialize(size, position)
    @size,@position = start_x,size, position
  end

  def direction
    return :across if [0,3,6].include?(@position)
    :down
  end

  def y
    points = { 0 => 1,
               1 => @size + 1,
               2 => @size + 1,
               3 => 1,
               4 => 0,
               5 => 0,
               6 => 1
    }
    points[@position]
  end

  def x
    points = {0 => 0,
             1 => 1,
             2 => @size + 2,
             3 => @size * 2 + 2,
             4 => @size +2,
             5 => 1 ,
             6 => @size + 1 }
    points[@position]
  end

end

