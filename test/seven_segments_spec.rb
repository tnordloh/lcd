require 'minitest/autorun'

require_relative '../lib/seven_segments'

describe SevenSegments do
  it "prints the first row of a letter" do
    SevenSegments.new(2).to_a[0].must_equal(" -- ")
    SevenSegments.new("2").to_a[0].must_equal(" -- ")
  end

  it "raises an error when non-digit value is passed in" do
    ->{SevenSegments.new("a")}.must_raise(ArgumentError)
  end
end
