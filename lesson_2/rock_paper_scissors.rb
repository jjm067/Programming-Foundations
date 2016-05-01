VALID_CHOICES = { "r" => "rock", "p" => "paper", "s" => "scissors", "l" => "lizard", "sp" => "spock" }
scores = { "player" => 0, "computer" => 0 }

VALID_CHOICES_VALUES = VALID_CHOICES.values

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def score_tally(player, computer, scores)
  if win?(player, computer)
    scores["player"] += 1
  elsif win?(computer, player)
    scores["computer"] += 1
  end
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to 'Rock, Paper, Scissors, Lizard, Spock'.")
prompt("You will be playing vs the computer! Whoever is the first to 5 wins, wins the game!")

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES_VALUES.join(', ')}")
    prompt("You may either type out the choice OR use 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard or 'sp' for spock.")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.value?(choice) || VALID_CHOICES.key?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES_VALUES.sample

  player_choice = ''
  VALID_CHOICES.each_pair do |key, value|
    if choice == key || choice == value
      player_choice = VALID_CHOICES.fetch(key)
    end
  end

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  display_result(player_choice, computer_choice)
  score_tally(player_choice, computer_choice, scores)

  puts "Player: #{scores['player']}"
  puts "Computer: #{scores['computer']}"

  if scores['player'] == 5
    puts "Congratulations! You won!"
    break
  elsif scores['computer'] == 5
    puts "YOU LOST!"
    break
  end

  prompt("Enter 'y' to play again.  Otherwise enter anything else to exit.")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
