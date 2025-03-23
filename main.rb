require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

board = Board.new
game = Game.new
game.player_creation
winner = false
players = [game.first_player, game.second_player]
i = 0

puts "#{game.first_player.name} goes first their mark is" + " #{game.first_player.player_mark}"
puts "#{game.second_player.name} goes first their mark is" + " #{game.second_player.player_mark}"
puts " "
board.show_board

until winner == true

  current_player = players[i % players.length]

  puts "#{current_player.name} make your move"
  move = gets.chomp.to_i
  if game.check_move(move) == true
    puts "Please make a valid move"
    move = gets.chomp.to_i until game.check_move(move) == false
  end
  game.add_move(move)
  board.finding(move)
  board.transform_board(players[0].player_mark, players[1].player_mark, i)
  board.show_transformed_board

  if game.game_over(board)
    puts "#{current_player.name} congratulations for wining!"
    winner = true
    puts "Would you like to keep playing Y/N?"
    answer = gets.chomp.downcase
    case answer
    when "y" then game.new_game && winner = false
    when "n" then game.reject_new_game && break
    end
  end

  i += 1

end
