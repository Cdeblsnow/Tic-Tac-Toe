require "colorize"
require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
board.reset_board
Game.player_creation
winner = false


puts "#{Game.player1.name} goes first their mark is" + " #{Game.player1.player_mark}"
puts "#{Game.player2.name} goes first their mark is" + " #{Game.player2.player_mark}"
puts ""
puts board.show_board

until winner == true

  puts "#{Game.player1.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(Game.player1.player_mark)
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

  puts "#{Game.player2.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(Game.player2.player_mark)
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
