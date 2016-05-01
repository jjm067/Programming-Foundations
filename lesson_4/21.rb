cards = [['H', 2], ['H', 3], ['H', 4], ['H', 5], ['H', 6], ['H', 7], ['H', 8], ['H', 9], ['H', 10], ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['H', 'A'],
 ['D', 2], ['D', 3], ['D', 4], ['D', 5], ['D', 6], ['D', 7], ['D', 8], ['D', 9], ['D', 10], ['D', 'J'], ['D', 'Q'], ['D', 'K'], ['D', 'A'],
 ['S', 2], ['S', 3], ['S', 4], ['S', 5], ['S', 6], ['S', 7], ['S', 8], ['S', 9], ['S', 10], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A'],
 ['C', 2], ['C', 3], ['C', 4], ['C', 5], ['C', 6], ['C', 7], ['C', 8], ['C', 9], ['C', 10], ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']]

player_hand = []
dealer_hand = []

def prompt(msg)
   puts "=>  #{msg}"
end

def total(cards)
  values = cards[0].map { |num| num[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
      elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "A" }.count.times do
  sum -= 10 if sum > 21
  end
  sum
end

def initialize_game(player, dealer, cards)
  player << cards.sample(2)
  dealer << cards.sample(2)
end

def busted(cards)
  total(cards) > 21
end

def hit(user, cards)
  user[0] << cards.sample
end

# prompt "Welcome to Twenty One!  This game is very similar to Black Jack.  However,
# there are a few key differences."

loop do
  initialize_game(player_hand, dealer_hand, cards)
  prompt "Your cards are #{player_hand[0][0]} and #{player_hand[0][1]}"

loop do
    prompt "hit or stay?"
    answer = gets.chomp
  hit(player_hand, cards) if answer == 'hit'
  if answer == 'stay' || busted(player_hand)
    break
  end
end
if busted(player_hand)
  prompt "You lose!"
end
  p player_hand
    prompt "Do you want to play again?"
    response = gets.chomp.to_s
    break unless response.start_with?('y')
end
