require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
scores = { 'Player' => 0, 'Computer' => 0}

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}"
  puts "Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd),', ')}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
      board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  elsif board.values_at(*line).count(PLAYER_MARKER) == 2
      board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    else
      nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
     square = find_at_risk_square(line, brd)
  break if square
end

  if !square
    square = brd[5]
  elsif
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def computer_starts_game(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def scores_tally(scores, brd)
  detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
    scores['Player'] += 1
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
    scores['Computer'] += 1
    end
  end
end

prompt "Welcome to Tic Tac Toe!  You will be playing vs the Computer.  The first player to 5 wins, wins the match"

loop do
  board = initialize_board
  prompt "Decide who makes the first move! 'p' if you want to start the game or 'c' if you want the computer to start"
  display_board(board)
  loop do
  choose = gets.chomp
  if choose == 'c'
    computer_starts_game(board)
    break
  elsif choose == 'p'
    break
  else prompt "That's not a valid choice!"
  end
end


  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end


  scores_tally(scores, board)

  puts "Player: #{scores['Player']}"
  puts "Computer: #{scores['Computer']}"

  if scores['Player'] == 5
    puts "Congratulations! You won!"
    break
  elsif scores['Computer'] == 5
    puts "You lost!"
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
