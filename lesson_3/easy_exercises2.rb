# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
ages.include?("Spot")

# Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_sum = 0
ages_arr = ages.values

ages_arr.each do |x|
  ages_sum += x
end


# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |key, value| value >= 100 }

# Question 4
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

# Question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

# Question 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.min

# Question 7
advice = "Few things in life are as important as house training your pet dinosaur."
advice =~ /Dino/

# Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index {|item| item =~ /Be/}

# Question 9
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |x|
  x[0, 3]
end

# Question 10
flintstones.map! {|x| x[0,3] }
