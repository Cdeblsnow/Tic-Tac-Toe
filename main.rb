require "colorize"

class Player
  attr_accessor :player_mark, :player_points, :number_of_moves, :name

  @@player_id = 0

  def initialize
    @@player_id += 1
    self.name = "Player#{@@player_id}"
    self.player_mark = (@@player_id == 1 ? "X".colorize(:red) : "O".colorize(:blue))
    self.player_points = 0
  end

  def show_player_id
    @@player_id
  end

  def add_point
    self.player_points += 1
  end
end

class Board
  attr_accessor :posx, :posy, :new_board

  @@current_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  def initialize
    self.posx = 0
    self.posy = 0
  end

  def show_board
    3.times do |y|
      3.times { |x| print new_board[x][y] } # 'vertical printing'
      puts
    end
  end

  def finding(move)
    p move
    3.times do |x|
      3.times do |y|
        next unless new_board[x][y] == move # check for the index of the object if valid

        self.posx = x
        self.posy = y
        return
      end
    end
  end

  def reset_board
    self.new_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # reset and create the board we will be working with
  end

  def transform_board(mark)
    x = posx
    y = posy
    return false unless new_board[x][y] != "X" && new_board[x][y] != "O"

    new_board[x][y] = mark
  end

  def show_transformed_board
    3.times do |y|
      3.times { |x| print new_board[x][y] } # 'vertical printing'
      puts
    end
  end

  def horizontal_win?
    3.times do |row|
      2.times do |i|
        break unless new_board[row][i] == new_board[row][i + 1]
        return true if i == 1
      end
    end
  end

  def vertical_win?
    3.times do |column|
      2.times do |i|
        break unless new_board[i][column] == new_board[i + 1][column]
        return true if i == 1
      end
    end
  end

  def down_right_diagonal_win?
    2.times do |i|
      break unless new_board[i][i] == new_board[i + 1][i + 1]
      return true if i == 1
    end
  end

  def down_left_diagonal_win?
    2.times do |i|
      break unless new_board[i][2 - i] == new_board[1 + i][1 - i]
      return true if i == 1
    end
  end
end

board = Board.new
board.reset_board
player1 = Player.new
player2 = Player.new
winner = false
playing_order = [player1, player2]
playing_order = playing_order.shuffle
firstp = playing_order[0]
secondp = playing_order[1]

puts "#{firstp.name} goes first their mark is" + " #{firstp.player_mark}"
puts "#{secondp.name} goes first their mark is" + " #{secondp.player_mark}"
puts ""
puts board.show_board

until winner == true

  puts "#{firstp.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(firstp.player_mark)
  board.show_transformed_board

  if board.horizontal_win? == true || board.vertical_win? == true ||
     board.down_left_diagonal_win? == true || board.down_right_diagonal_win?

    firstp.add_point
    puts "#{firstp.name} congratulations for wining!"
    winner = true
    puts "Would you like to keep playing Y/N?"
    answer = gets.chomp
    if answer == "Y"
      winner = false
      playing_order = [player1, player2]
      playing_order = playing_order.shuffle
      firstp = playing_order[0]
      secondp = playing_order[1]
      board.reset_board
      puts "#{firstp.name} goes first their mark is" + " #{firstp.player_mark}"
      puts "#{secondp.name} goes first their mark is" + " #{secondp.player_mark}"
      puts ""
      puts board.show_board
    else
      puts "Thanks for playing, the final scores are #{firstp.name}:#{firstp.player_points} and #{secondp.name}:#{secondp.player_points}"
      break
    end
  end

  puts "#{secondp.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(secondp.player_mark)
  board.show_transformed_board

  next unless board.horizontal_win? == true || board.vertical_win? == true ||
              board.down_left_diagonal_win? == true || board.down_right_diagonal_win?

  secondp.add_point
  puts "#{secondp.name} congratulations for wining!"
  winner = true
  puts "Would you like to keep playing Y/N?"
  answer = gets.chomp
  if answer == "Y"
    winner = false
    playing_order = [player1, player2]
    playing_order = playing_order.shuffle
    firstp = playing_order[0]
    secondp = playing_order[1]
    board.reset_board
    puts "#{firstp.name} goes first their mark is" + " #{firstp.player_mark}"
    puts "#{secondp.name} goes first their mark is" + " #{secondp.player_mark}"
    puts ""
    puts board.show_board
  else
    puts "Thanks for playing, the final scores are #{firstp.name}:#{firstp.player_points} and #{secondp.name}:#{secondp.player_points}"
    break
  end
end
