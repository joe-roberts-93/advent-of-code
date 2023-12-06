require_relative 'input'
require_relative 'part_one'
input = INPUT
input_array = input.split(/$/)
def get_duration_and_record(input_array)
  p input_array
  time = input_array[0].scan(/\d+/).join.to_i
  record = input_array[1].scan(/\d+/).join.to_i
  race_hash = Hash[time, record]
  return race_hash
end
race_duration = get_duration_and_record(input_array).keys[0]
current_record = get_duration_and_record(input_array).values[0]
puts number_of_winning_results(all_possible_results(race_duration, 14), current_record)
