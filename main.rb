require 'colorize'
class Player
  attr_accessor :player_id, :player_mark, :player_points, :number_of_moves
  @@player_id = 0

  def initiailize 
    @@player_id += 1
    player_id == 1 ? self.player_mark = "X" : self.player_mark = "O" 
    self.player_points = 0
    self.number_of_moves = 0
  end
end

class Board

  @@current_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  
  def initial_board 
    3.times do |y|
      3.times { |x| print '%3i' % @@current_board[x][y] }
      puts
    end
  end

  def finding
    board_index = 0
    3.times do |y|
      3.times do |x|
        if @@current_board[x][y] == 2 #check for the index of the object if valid
          board_index = "#{x}#{y}"
          p board_index
          break
        end
      end
    end
  end

end

class Game
end

c = Board.new
c.initial_board
c.finding