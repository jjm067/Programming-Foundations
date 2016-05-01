# Question 1
 10.times { |i|  puts (" " * i) + "The Flintstones Rock!" }

# Question 2
statement = "The Flintstones Rock"
statement_hash = {}
statement_hash.default = 0
statement_arr = statement.split('')

statement_arr.each do |char|
  statement_hash[char] += 1
end

statement_hash.delete(' ')
p statement_hash

# Question 3
# You are trying to add a string to an integer.  To fix it, you can do this
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 4

# Question 5
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend
    dividend -= 1
  end
  divisors
end

# Question 6

# Question 7

# Question 8
def titleize(words)
  words.split.map { |word| word.capitalize }.join(' ')
end

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  if value["age"] < 17
      value["age_group"] = "youth"
  elsif value["age"] > 17 && value["age"] < 65
      value["age_group"] = "adult"
    else
      value["age_group"] = "senior"
  end
end

