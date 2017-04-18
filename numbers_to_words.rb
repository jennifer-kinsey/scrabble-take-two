require "pry"

class NumbersToWords
  attr_reader :ones_values
  attr_reader :teens_values
  attr_reader :tens_values
  attr_reader :exponential_values

  def initialize
    @ones_values = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
    }

    @teens_values = {
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
    }

    @tens_values = {
      2 => "twenty",
      3 => "thirty",
      4 => "fourty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
    }


    @exponential_values = {
      "trillion" => 15,
      "billion" => 12,
      "million" => 9,
      "thousand" => 6,
    }
  end

  def transform_number(number)

    one_thousand_and_beyond(number)

  end

  def numbers_to_array(number)
    number.to_s.split("").map{|num| num.to_i}
  end

  def one_to_ninetynine(number)

    numbers = numbers_to_array(number)
    number_word = ""

    if numbers.length > 2
      numbers = numbers.slice(-2,2)
      number = numbers.join("").to_i
      if number == 0
        return
      else
        number_word.concat(" ")
      end
    end


    if number < 10
      number_word.concat(ones_values.fetch(numbers[-1]))
    elsif number < 20
      number_word.concat(teens_values.fetch(number))
    elsif number < 100
      number_word.concat(tens_values.fetch(numbers[-2]))
      if numbers[-1] > 0
        number_word.concat(" ")
        number_word.concat(ones_values.fetch(numbers[-1]))
      end
    end

    number_word

  end

  def one_hundred_to_nine_hundred(number)
    hundreds_place = numbers_to_array(number)[-3]
    number_word = ""
    if hundreds_place > 0
      number_word = "#{ones_values.fetch(hundreds_place)} hundred"
    end
    number_word
  end

  def one_to_999(number)
    number_word = ""

    if number == 0 || number == nil
      return number_word
    end

    if number > 99
      number_word = "#{one_hundred_to_nine_hundred(number)}#{one_to_ninetynine(number)}"
    else
      number_word = one_to_ninetynine(number)
    end

    number_word
  end

  def one_thousand_and_beyond(number)
    number_word = ""

    position_difference = numbers_to_array(number).length % 3

    exponential_values.each_pair do |exponent, position|
      position = -(position)

      if position_difference == 0
        exponential_number = numbers_to_array(number).slice(position, 3)
        if exponential_number != nil
          exponential_number = exponential_number.join.to_i
          number_word.concat("#{one_to_999(exponential_number)} #{exponent} ")
        end
      elsif numbers_to_array(number).length + 1 == position.abs || numbers_to_array(number).length + 2 == position.abs
        exponential_number = numbers_to_array(number).slice(0, position_difference)
        exponential_number = exponential_number.join.to_i
        number_word.concat("#{one_to_999(exponential_number)} #{exponent} ")
        position_difference = 0
      end

    end

    number_word.concat(one_to_999(number))

    number_word.rstrip

  end

end
