# Exercise: 1 - Part One
# Takes the array of strings and returns the sum of the first and last digits of each element in the array.

def sum_of_first_last_digits(array)
  letters_removed = array.map do |number|
    number.gsub(/\D/,"")
  end

  first_last_numbers = letters_removed.map do |number|
    string = "#{number[0]}#{number[-1]}"
    string.to_i
  end

  first_last_numbers.sum
end
