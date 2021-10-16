require 'pry'

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, token)
    board[index] = token
  end

  def position_taken?(board, position)
    board[position] != "" && board[position] != " "
  end
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn_count(board)
    counter = 0
    board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
    else
      end
    end
    counter
  end
  
  def current_player(board)
    if turn_count(board).modulo(2).zero?
      return "X"
    else
      return "O"
    end
  end
  
  def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_cmbo|
    board[win_cmbo[0]] == board[win_cmbo[1]] &&
    board[win_cmbo[1]] == board[win_cmbo[2]] &&
    position_taken?(board, win_cmbo[1])
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |win_cmbo|
    board[win_cmbo[0]] == "X" || board[win_cmbo[0]] == "O"
    position_taken?(board, win_cmbo[0])
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end


def winner(board)
  if array = won?(board)
    board[array[0]]
  end
end  

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end