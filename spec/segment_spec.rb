require 'minitest/autorun'

require_relative '../lib/segment'

describe Segment do
  it "knows what direction it should light up in" do
    Segment.new(0,0).direction.must_equal(:across)
    Segment.new(0,1).direction.must_equal(:down)
  end

  it "knows how to determine it's y position" do
    Segment.new(2,1).y.must_equal(3)
  end
end
