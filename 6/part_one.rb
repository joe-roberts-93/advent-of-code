require_relative 'input'

input = INPUT
input_array = input.split(/$/)

def get_durations_and_records(input_array)
times = input_array[0].scan(/\d+/).map(&:to_i)
records = input_array[1].scan(/\d+/).map(&:to_i)
return race_hash = Hash[times.zip records]
end

def distance_travelled(charging_time,race_duration)
  speed = charging_time
  remaining_time = race_duration - charging_time
  return distance_travelled = speed * remaining_time
  # puts "Race duration is #{race_duration}. Charged for #{charging_time}ms, travelled #{distance_travelled}mm"
end

def all_possible_results(race_duration, start_time)
 results = []
  charging_times = start_time..race_duration
  charging_times.each do |charging_time|
   results << distance_travelled(charging_time, race_duration)
  end
  return results
end

def number_of_winning_results(all_possible_results, current_record)
  winning_results = []
  all_possible_results.select do |result|
    if result > current_record
      winning_results << result
    end
  end
  return winning_results.length
end

# get_durations_and_records(input_array).each do |race_duration, current_record|
#   possible_wins = number_of_winning_results(all_possible_results(race_duration, 0), current_record)
#   puts "For a race of #{race_duration}ms, the current record is #{current_record}mm.
# The number of possible outcomes that could beat this time is #{possible_wins} \n\n"
# end
