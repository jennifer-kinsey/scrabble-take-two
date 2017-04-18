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
      100 => "hundred",
      1000 => "thousand",
      1000000 => "million",
      1000000000 => "billion",
    }
  end

  def transform_number(number)

    number_word = ""

    if number > 99
      number_word = "#{one_hundred_to_nine_hundred(number)}#{one_to_ninetynine(number)}"
    else
      number_word = one_to_ninetynine(number)
    end

    number_word

  end

  def numbers_to_array (number)
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
  

end
