require 'minitest/autorun'

require_relative '../lib/seven_segments'

describe SevenSegments do
  it "prints the first row of a letter" do
    SevenSegments.new(2).to_s(0).must_equal(" --  ")
  end
end
