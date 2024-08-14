require colorize
class Player
  attr_accessor :player_id, :player_mark, :player_points, :number_of_moves
  self.player_id = 0

  def initiailize 
    self.player_id += 1
    player_id == 1 ? self.player_mark = "X" : self.player_mark = "O" 
    self.player_points = 0
    self.number_of_moves = 0
  end
end

class Board
  def board 
    current = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    3.times do |y|
      3.times { |x| print '%3i' % current[x][y] }
      puts
    end
  end

  def board_update
    
  end
end

class Game
end