# Question 1
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

age_sum = 0

munsters.each do |key, value|
  if value["gender"] == "male"
    age_sum += value["age"]
  end
end

# Question 2
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]} year old #{value["gender"]}"
end

# Question 3


# Question 4
sentence = "Humpty Dumpty sat on a wall."
puts sentence.split.reverse!.join(' ')

# Question 5
34

# Question 6

# Question 7
'paper'

# Question 8
'no'