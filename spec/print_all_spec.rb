require 'minitest/autorun'

require_relative '../lib/print_all'

describe PrintAll do
  it "raises an error when ono-digit value is passed in" do
    ->{PrintAll.new(["a"])}.must_raise(ArgumentError)
  end
end
