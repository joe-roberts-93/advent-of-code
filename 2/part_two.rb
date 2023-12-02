require_relative 'input'
input = INPUT
input_array = input.split(/$/)

def clean_game(game)
  game.gsub!(/Game \d+:/, "").strip
end

def get_pairs(game)
  game.split(/;|,/)
end

def method(input_array)
  sum = 0
  input_array.each do |game|
    lowest_color_required= {red: 0, green: 0, blue: 0}
    cleaned_game = clean_game(game)
    game_array = get_pairs(cleaned_game)
    game_array.each do |pair|
      pair_array = pair.scan(/(red|green|blue|\d+)/).flatten
      # create a hash with the color as the key and the number as the value
      # if the number is greater than the value, replace the value
      # otherwise, do nothing
      if lowest_color_required[pair_array[1].to_sym] < pair_array[0].to_i
        lowest_color_required[pair_array[1].to_sym] = pair_array[0].to_i
      end
    end
    puts lowest_color_required
    subtotal =  lowest_color_required[:red] * lowest_color_required[:green] * lowest_color_required[:blue]
    puts "Subtotal: #{subtotal}"
    sum += subtotal
  end
  puts "Sum: #{sum}"
end

method(input_array)
