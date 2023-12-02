require './input.rb'
MAX_HASH= {red: 12, green: 13, blue: 14}
input = INPUT
input_array = input.split(/$/)

#Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red

def clean_game(game)
  game.gsub!(/Game \d+:/, "").strip
end

def get_game_number(game)
  game[/\d+/].to_i
end

def round_valid?(round)
  puts "Round: #{round}"
  round_valid = false
  round_valid_array = []
  colors = round.scan(/(red|green|blue)/)
  numbers = round.scan(/\d+/)
  numbers.map! {|number| number.to_i}
  colors.each_with_index do |color, index|
    numbers[index] > MAX_HASH[color[0].to_sym] ? draw_valid = false : draw_valid = true
    round_valid_array << draw_valid
  end
  round_valid_array.include?(false) ? round_valid = false : round_valid = true
  round_valid
end

# round is a series of draws, which can be expressed as two arrays each sharing the same index
# I need the number of each color in each draw
# colors is an array of arrays, each containing a color
# this goes through the array of colors, checking whether the number at the same index in numbers is greater than the max for that color
# it then pushes true or false to an array
# if the array contains a false, the game is invalid
# then I need to check whether the round is valid and return this value

def game_valid?(game_array)
  game_valid_array = []
  game_valid = false
  game_array.each do |round|
    round_valid = round_valid?(round)
    game_valid_array << round_valid
    game_valid_array.include?(false) ? game_valid = false : game_valid = true
  end
  return game_valid
end

def method(array)
  sum = 0
  array.each do |game|
    # game is a series of rounds, each round is a series of draws from a bag
    # i need the game number from this
    game_number = get_game_number(game)
    cleaned_game = clean_game(game)
    game_array = cleaned_game.split(";")
    puts "Game #{game_number}:"
    if game_valid?(game_array)
      puts "Game #{game_number} is valid"
      sum += game_number
    else
      puts "Game #{game_number} is invalid"
      sum += 0
    end
  end
  return sum
end
puts method(input_array)
