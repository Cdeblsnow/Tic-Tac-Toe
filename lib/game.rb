require_relative "player"
require_relative "board"

class Game
  attr_reader :first_player, :second_player

  def initialize
    @moves = [0]
    @first_player = Player.new(1)
    @second_player = Player.new(2)
    shuffle_players(@first_player, @second_player)
  end

  def add_move(move)
    @moves << move if move.is_a? Numeric
  end

  def check_move(move)
    @moves.include?(move)
  end

  def reset_moves
    @moves = [0]
  end

  def game_over(board, i)
    if i.even?
      p1_win?(board)
    else
      p2_win?(board)
    end
  end

  def new_game
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
       board.down_left_diagonal_win? == true || board.down_right_diagonal_win? == true

      @first_player.add_point
      return true

    end
    false
  end

  def p2_win?(board)
    if board.horizontal_win? == true || board.vertical_win? == true ||
       board.down_left_diagonal_win? == true || board.down_right_diagonal_win? == true

      @second_player.add_point
      return true

    end
    false
  end

  def shuffle_players(p1, p2)
    playing_order = [p1, p2]
    playing_order = playing_order.shuffle
    @first_player = playing_order[0]
    @second_player = playing_order[1]
  end
end
