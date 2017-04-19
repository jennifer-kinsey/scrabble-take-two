require "./numbers_to_words"
require "rspec"
require "pry"


describe('numbers_to_words#letter_score') do
  let(:number) { NumbersToWords.new }

  it("returns the string 'one' when passed the number 1") do
    expect(number.transform_number(1)).to(eq("one"))
  end

  it("returns the string 'ten' when passed the number 10") do
    expect(number.transform_number(10)).to(eq("ten"))
  end

  it("returns the string 'thirteen' when passed the number 13") do
    expect(number.transform_number(13)).to(eq("thirteen"))
  end

  it("returns the string 'twenty' when passed the number 20") do
    expect(number.transform_number(20)).to(eq("twenty"))
  end

  it("returns the string 'twenty five' when passed the number 25") do
    expect(number.transform_number(25)).to(eq("twenty five"))
  end

  it("returns the string 'ninety nine' when passed the number 99") do
    expect(number.transform_number(99)).to(eq("ninety nine"))
  end

  it("returns the string 'one hundred' when passed the number 100") do
    expect(number.transform_number(100)).to(eq("one hundred"))
  end

  it("returns the string 'one hundred one' when passed the number 101") do
    expect(number.transform_number(101)).to(eq("one hundred one"))
  end

  it("returns the string 'three hundred' when passed the number 300") do
    expect(number.transform_number(300)).to(eq("three hundred"))
  end

  it("returns the string 'five hundred fifty five' when passed the number 555") do
    expect(number.transform_number(555)).to(eq("five hundred fifty five"))
  end

  it("returns the string 'nine hundred ninety nine' when passed the number 999") do
    expect(number.transform_number(999)).to(eq("nine hundred ninety nine"))
  end

  it("returns the string 'one thousand two hundred fifty five' when passed the number 1255") do
    expect(number.transform_number(1255)).to(eq("one thousand two hundred fifty five"))
  end

  it("returns the string 'one thousand two hundred fifty five' when passed the number 34,657,879,000") do
    expect(number.transform_number(34657879000)).to(eq("thirty four billion six hundred fifty seven million eight hundred seventy nine thousand"))
  end

  it("returns the string 'one million one' when passed the number 1,000,001") do
    expect(number.transform_number(1000001)).to(eq("one million one"))
  end

end
