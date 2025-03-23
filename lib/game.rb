require_relative "player"
require_relative "board"

class Game
  attr_reader :first_player, :second_player

  def initialize(board)
    @moves = []
    @first_player = ""
    @second_player = ""
    @new_board = board
  end

  def add_move(move)
    @moves << move
  end

  def check_move(move)
    @moves.include?(move)
  end

  def game_over(board)
    p1_win?(board) || p2_win?(board)
  end

  def player_creation
    Player.id_reset
    player1 = Player.new
    player2 = Player.new
    shuffle_players(player1, player2)
  end

  def self.new_game
    player_creation
    puts "#{@first_player.name} goes first their mark is" + " #{@first_player.player_mark}"
    puts "#{@second_player.name} goes first their mark is" + " #{@second_player.player_mark}"
    puts ""
  end

  def reject_new_game
    puts "Thanks for playing!, the final scores are #{@first_player.name}:#{@first_player.player_points} and #{@second_player.name}:#{@second_player.player_points}"
  end

  private

  def p1_win?(board)
    if board.horizontal_win? == true || board.vertical_win? == true ||
       board.down_left_diagonal_win? == true || board.down_right_diagonal_win?

      @first_player.add_point
      true

    end
  end

  def p2_win?(board)
    if board.horizontal_win? == true || board.vertical_win? == true ||
       board.down_left_diagonal_win? == true || board.down_right_diagonal_win?

      @second_player.add_point
      true

    end
  end

  def shuffle_players(p1, p2)
    playing_order = [p1, p2]
    playing_order = playing_order.shuffle
    @first_player = playing_order[0]
    @second_player = playing_order[1]
  end
end
