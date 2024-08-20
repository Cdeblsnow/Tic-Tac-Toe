
require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
Game.player_creation
winner = false


puts "#{Game.player1.name} goes first their mark is" + " #{Game.player1.player_mark}"
puts "#{Game.player2.name} goes first their mark is" + " #{Game.player2.player_mark}"
puts ""
Board.show_board

until winner == true

  puts "#{Game.player1.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(Game.player1.player_mark)
  board.show_transformed_board

  if Game.p1_win?(board) == true
    puts "#{Game.player1.name} congratulations for wining!"
    winner = true
    puts "Would you like to keep playing Y/N?"
    answer = gets.chomp.downcase
    case answer
    when "y" then Game.new_game && winner = false
    when "n" then Game.reject_new_game && break 
    end
  end
  

  puts "#{Game.player2.name} make your move"
  move = gets.chomp.to_i
  board.finding(move)
  board.transform_board(Game.player2.player_mark)
  board.show_transformed_board

  if Game.p2_win?(board) == true
    puts "#{Game.player2.name} congratulations for wining!"
    winner = true
    puts "Would you like to keep playing Y/N?"
    answer = gets.chomp.downcase
    case answer
    when "y" then Game.new_game && winner = false
    when "n" then Game.reject_new_game  
    end
  end
end
