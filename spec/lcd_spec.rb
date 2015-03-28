require 'minitest/autorun'

require_relative '../lib/lcd'

describe LCD do
  it "raises an error when ono-digit value is passed in" do
    ->{LCD.new(["a"])}.must_raise(ArgumentError)
  end
end
