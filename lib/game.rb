require_relative "player"
require_relative "board"
class Game
  def self.shuffle_players(p1, p2)
    playing_order = [p1, p2]
    playing_order = playing_order.shuffle
    @firstp = playing_order[0]
    @secondp = playing_order[1]
  end

  def self.player_creation
    Player.id_reset
    player1 = Player.new
    player2 = Player.new
    Game.shuffle_players(player1, player2)
  end

  def self.player1
    @firstp
  end

  def self.player2
    @secondp
  end

  def self.p1_win?(board)
    if board.horizontal_win? == true || board.vertical_win? == true ||
      board.down_left_diagonal_win? == true || board.down_right_diagonal_win?
 
     Game.player1.add_point
     return true
     
    end
  end

  def self.p2_win?(board)
    if board.horizontal_win? == true || board.vertical_win? == true ||
      board.down_left_diagonal_win? == true || board.down_right_diagonal_win?
 
     Game.player2.add_point
     return true
     
    end
  end

  def self.new_game 
       Game.player_creation
       puts "#{Game.player1.name} goes first their mark is" + " #{Game.player1.player_mark}"
       puts "#{Game.player2.name} goes first their mark is" + " #{Game.player2.player_mark}"
       puts ""
       Board.show_board
  end

  def self.reject_new_game
    puts "Thanks for playing!, the final scores are #{Game.player1.name}:#{Game.player1.player_points} and #{Game.player2.name}:#{Game.player2.player_points}"
  end
end