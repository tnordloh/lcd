class Segment

  SEGMENT_DIRECTION ||= {
    0 => :across,
    1 => :down,
    2 => :down,
    3 => :across,
    4 => :down,
    5 => :down,
    6 => :across,
  }

  def initialize(size, position)
    @size,@position = size, position
    @size.freeze
    @position.freeze
    unless position_valid?
      raise ArgumentError, "segment number #{@position} out of range" 
    end
    unless size_valid?
      raise ArgumentError, "segment number #{@size} out of range" 
    end
  end

  def describe_segment
    returnme = []
    if(SEGMENT_DIRECTION[@position] == :across) then
      @size.times { |segment_length|  returnme << {x: x, y: y+segment_length, char: "-"} }
    else
      @size.times { |segment_length|  returnme << {x: x+segment_length,y: y, char: "|"} }
    end
    returnme
  end

  def y_offsets
    @y_offsets ||= calculate_y_offsets
  end

  def x_offsets
    @x_offsets ||= calculate_x_offsets
  end

  def y
    x_offsets[@position]
  end

  def x
    y_offsets[@position]
  end

  private

  def calculate_x_offsets
    { 0 => 1,
      1 => @size + 1,
      2 => @size + 1,
      3 => 1,
      4 => 0,
      5 => 0,
      6 => 1
    }
  end

  def calculate_y_offsets
    { 0 => 0,
      1 => 1,
      2 => @size + 2,
      3 => @size * 2 + 2,
      4 => @size +2,
      5 => 1 ,
      6 => @size + 1 
    }
  end


  def position_valid?
    (0..6).include?(@position) 
  end

  def size_valid?
    @size > 0
  end

end

