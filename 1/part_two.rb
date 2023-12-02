require "./1_input.rb"
require "./part_one.rb"
input = INPUT
array = input.split

def substitute_numbers(string)
  string.gsub(/one/, "1").gsub(/two/, "2").gsub(/three/, "3").gsub(/four/, "4").gsub(/five/, "5").gsub(/six/, "6").gsub(/seven/, "7").gsub(/eight/, "8").gsub(/nine/, "9")
end

def method(array)
  array.map! do |string|
    pattern = /(?=(one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9|0))/
    # question: what does the ?= do?
    # answer: it's a positive lookahead assertion, which means that it matches the pattern only if it's followed by the pattern in the parentheses
    digits = string.scan(pattern).flatten
    print digits
    digits.map! do |number|
      substitute_numbers(number)
    end
    digits.join
  end
end

new_array = method(array)
print sum_of_first_last_digits(new_array)
