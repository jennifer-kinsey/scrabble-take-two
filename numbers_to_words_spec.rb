require "./numbers_to_words"
require "rspec"


describe('numbers_to_words#letter_score') do
  let(:number) { NumbersToWords.new }

  it("returns the string 'one' when passed the number 1") do
    expect(number.transform_number(1)).to(eq("one"))
  end

end
