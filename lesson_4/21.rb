cards = [['Hearts', 2], ['Hearts', 3], ['Hearts', 4], ['Hearts', 5], ['Hearts', 6], ['Hearts', 7], ['Hearts', 8], ['Hearts', 9], ['Hearts', 10], ['Hearts', 'Jack'], ['Hearts', 'Queen'], ['Hearts', 'King'], ['Hearts', 'Ace'],
 ['Diamonds', 2], ['Diamonds', 3], ['Diamonds', 4], ['Diamonds', 5], ['Diamonds', 6], ['Diamonds', 7], ['Diamonds', 8], ['Diamonds', 9], ['Diamonds', 10], ['Diamonds', 'Jack'], ['Diamonds', 'Queen'], ['Diamonds', 'King'], ['Diamonds', 'Ace'],
 ['Spades', 2], ['Spades', 3], ['Spades', 4], ['Spades', 5], ['Spades', 6], ['Spades', 7], ['Spades', 8], ['Spades', 9], ['Spades', 10], ['Spades', 'Jack'], ['Spades', 'Queen'], ['Spades', 'King'], ['Spades', 'Ace'],
 ['Clubs', 2], ['Clubs', 3], ['Clubs', 4], ['Clubs', 5], ['Clubs', 6], ['Clubs', 7], ['Clubs', 8], ['Clubs', 9], ['Clubs', 10], ['Clubs', 'Jack'], ['Clubs', 'Queen'], ['Clubs', 'King'], ['Clubs', 'Ace']]

def prompt(msg)
   puts "=>  #{msg}"
end

def total(cards)
  values = cards[0].map { |num| num[1] }

  sum = 0
  values.each do |value|
    if value == "Ace"
      sum += 11
      elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "Ace" }.count.times do
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

def detect_winner(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)

  if busted(player)
    :player_busts
  elsif busted(dealer)
    :dealer_busts
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_winner(player, dealer)
  results = detect_winner(player, dealer)
  puts case results
  when :player_busts
    "You bust. Dealer wins!"
  when :dealer_busts
    "Dealer busts. You win!"
  when :player
    "You win!"
  when :dealer
    "Dealer wins!"
  when :tie
    "It's a tie!"
  end
end

prompt "Welcome to Twenty One!  This game is just like Black Jack, except there is no doubling down."

loop do
  player_hand = []
  dealer_hand = []
  initialize_game(player_hand, dealer_hand, cards)
  prompt "Your cards are: the #{player_hand[0][0][1]} of #{player_hand[0][0][0]} and the #{player_hand[0][1][1]} of #{player_hand[0][1][0]}"
  prompt "Dealer cards are: the #{dealer_hand[0][0][1]} of #{dealer_hand[0][0][0]} and unknown"
  loop do
    prompt "Your turn:"
    prompt "hit or stay?"
    answer = gets.chomp
    if answer == 'hit'
      hit(player_hand, cards)
      prompt "Your hand is now: #{player_hand}"
    elsif answer == 'stay'
      prompt "You chose to stay."
    else prompt "That's not a valid choice."
    end
    break if answer == 'stay' || busted(player_hand)
  end
  prompt "Dealer turn:"
    while total(dealer_hand) < 17
    hit(dealer_hand, cards)
      prompt "Dealer has hit"
    end
    if total(dealer_hand) >= 17
      prompt "Dealer has stayed"
    end
    display_winner(player_hand, dealer_hand)
  puts "Player hand: #{player_hand}"
  puts "Dealer hand: #{dealer_hand}"
  prompt "Do you want to play again?"
  response = gets.chomp.to_s
  break unless response.start_with?('y')
end
