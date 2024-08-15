require "colorize"
require "rubocop"
class Player
  attr_accessor :player_mark, :player_points, :number_of_moves

  @@player_id = 0

  def initialize
    @@player_id += 1
    self.player_mark = (@@player_id == 1 ? "X" : "O")
    self.player_points = 0
    self.number_of_moves = 0
  end

  def show_player_id
    @@player_id
  end

  def add_move
    self.number_of_moves += 1
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
      3.times { |x| print "%3i" % @@current_board[x][y] } # 'vertical printing'
      puts
    end
  end

  def finding(move)
    3.times do |y|
      3.times do |x|
        next unless @@current_board[x][y] == move # check for the index of the object if valid

        self.posx = x
        self.posy = y
        p posx
        p posy
        break
      end
    end
  end

  def transformable_board
    self.new_board = @@current_board
  end

  def show_pos
    x = posx
    y = posy
    p new_board[x][y]
  end
end

boo = Board.new
player1 = Player.new
player2 = Player.new

boo.finding(2)
boo.transformable_board
boo.show_pos
