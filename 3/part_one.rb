require_relative 'input'
input = TEST_INPUT
input_array = input.split(/$/)
# find any number adjacent to a symbol in the input, including diagonally.
# Iterate through the lines
# If the character is a number, check the characters to the left, right, up, down, and diagonally
# Do this by checking the index before and after, but also the index (and before and after) of the line above and below
# How do I store the three lines at once?

def method(array)
  array.each_with_index do |line, index|
    line_index = index
    line.scan(/\d+/).each do |number|
      number_start = line.index(number)
      number_end = number_start + number.length - 1
      puts "Line number: #{line_index}"
      puts "Number: #{number}"
      puts "Number start: #{number_start}"
      puts "Number end: #{number_end}"
      if line[number_start-1] && line[number_start-1] =~ /[^\.\1234567890]/
        puts "Character before: #{line[number_start-1]}"
      end
      if line[number_end+1] && line[number_start-1] =~ /[^\.\1234567890]/
        puts "Character after: #{line[number_end+1]}"
      end
      if array[line_index-1][number_start-1] && line[number_start-1] =~ /[^\.\1234567890]/
        puts "Character above left: #{array[line_index-1][number_start-1]}"
      end
      if array[line_index-1][number_start] && line[number_start-1] =~ /[^\.\1234567890]/
        puts "Character above: #{array[line_index-1][number_start]}"
      end
      if array[line_index-1][number_end+1] && line[number_start-1] =~ /[^\.1234567890]/
        puts "Character above right: #{array[line_index-1][number_end+1]}"
      end
    end
  end
end
method(input_array)


# number = []
#     indices = []
#     line_array.each_with_index do |character, index|
#       if character[/\d+/]
#         number << character
#         indices << index
#       end
#     end
#     puts "Line number: #{line_index}"
#     puts "Number: #{number}"
#     puts "Indices: #{indices}"

# array.each_with_index do |line, index|
#   line_array = line.split("")
#   line_array.each_with_index do |character, index|
#     if character =~ /\d/
#       puts "Character: #{character}"
#       puts "Index: #{index}"
#       puts "Line: #{line}"
#       puts "Line above: #{array[index-1]}"
#       puts "Line below: #{array[index+1]}"
#       puts "Character above: #{array[index-1][index]}"
#       puts "Character below: #{array[index+1][index]}"
#       puts "Character before: #{line_array[index-1]}"
#       puts "Character after: #{line_array[index+1]}"
#       puts "Character above and before: #{array[index-1][index-1]}"
#       puts "Character above and after: #{array[index-1][index+1]}"
#       puts "Character below and before: #{array[index+1][index-1]}"
#       puts "Character below and after: #{array[index+1][index+1]}"
#     end
#   end
# end
