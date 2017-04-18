require "./numbers_to_words"
require "rspec"


describe('numbers_to_words#letter_score') do
  let(:number) { NumbersToWords.new }

  it("returns the string 'one' when passed the number 1") do
    expect(number.transform_number(1)).to(eq("one"))
  end

  it("returns the string 'ten' when passed the number 10") do
    expect(number.transform_number(10)).to(eq("ten"))
  end

  it("returns the string 'twenty' when passed the number 20") do
    expect(number.transform_number(20)).to(eq("twenty"))
  end

  it("returns the string 'twenty five' when passed the number 25") do
    expect(number.transform_number(25)).to(eq("twenty five"))
  end

  xit("returns the string 'one hundred' when passed the number 100") do
    expect(number.transform_number(100)).to(eq("one hundred"))
  end



end
