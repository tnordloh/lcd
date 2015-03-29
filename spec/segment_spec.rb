require 'minitest/autorun'

require_relative '../lib/segment'

describe Segment do
  it "knows what direction it should light up in" do
    Segment.new(1,0).direction.must_equal(:across)
    Segment.new(1,1).direction.must_equal(:down)
  end

  it "knows how to determine it's y position" do
    Segment.new(2,1).y.must_equal(3)
  end

  it "raises an error when position is invalid" do
    ->{Segment.new(2,8)}.must_raise(ArgumentError)
  end

  it "raises an error when size is invalid" do
    ->{Segment.new(-1,4)}.must_raise(ArgumentError)
  end

  it "gives the fill range" do
    p Segment.new(2,2).fill_range
  end
end
