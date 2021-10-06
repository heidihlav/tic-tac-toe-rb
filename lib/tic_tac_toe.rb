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

  def move(board, index, current_player)
    board[index] = current_player
  end

  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn_count(board)
    counter = 0
    board.each do |token|
      if token == "X" || token == "O"
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
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(board, index)
        move(board, index, token = "X")
    else 
        turn(board)  
    end  
    display_board(board)
  end 

  def won?(board)
    WIN_COMBINATIONS.find { 
      |array| board[array[0]] == board[array[1]] && 
      board[array[1]] == board[array[2]] &&
      position_taken?(board, array[1])
    }
  end

  def full?(board)
    board.none? {|token|
      token ==  " "
    }
  end

  def draw?(board)
    full?(board) && !won?(board)
  end

  def over?(board)
    draw?(board) || won?(board)
  end

  def winner(board)
    if array = won?(board)
      board[array[0]]
    end
  end  

  def play(board)
    until over?(board)
      turn(board)    
        if won?(board)
          puts "Congratulations!"
        else draw?(board)
          puts "Cat\'s Game!"
        end
    end
  end

  # board[8] == "X" do
  #   turn(board)