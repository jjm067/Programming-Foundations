# Question 1
# I would expect it to print out 1, 2, 2, 3 because you are calling .uniq on the array
# which does not mutate the caller, but instead creates a new array.  You then puts the original
# array.  Since you did not use p numbers, it will not print out the actualy array, but the values in the array.

# Question 2
# ! after methods usually mutates the caller.  But sometimes it is just part of the method
# ? at the end of a method usually indicates that the method is evaluating to a boolean.

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

# Question 4
# numbers.delete_at(1) deletes the value at the 1 index.
# numbers.delete(1) looks for the number 1 in the array and deletes it.

# Question 5
(10..100).include?(42)

# Question 6
famous_words = "seven years ago..."
famous_words = "four scour and " + famous_words
"four scour and " << famous_words

# Question 7
42

# Question 8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

# Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")

# Question 10
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}

flintstones.each_with_index do
  |key, value| flintstones_hash[key] = value
end

p flintstones_hash
