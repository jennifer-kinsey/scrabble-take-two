class NumbersToWords
  def transform_number(number)
    ones_values = {
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

    teens_values = {
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

    tens_values = {
      2 => "twenty",
      3 => "thirty",
      4 => "fourty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
    }

    exponential_values = {
      100 => "hundred",
      1000 => "thousand",
      1000000 => "million",
      1000000000 => "billion",
    }

    number_word = ""

    numbers = number.to_s.split(//).map{|num| num.to_i}

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
end
