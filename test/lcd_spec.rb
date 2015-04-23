require 'minitest/autorun'

require_relative '../lib/lcd'

describe LCD do
  it "raises an error when non-digit value is passed in" do
    ->{LCD.new(["a"])}.must_raise(ArgumentError)
  end
end
