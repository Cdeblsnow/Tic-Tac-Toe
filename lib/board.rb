class Board
  attr_accessor :posx, :posy, :new_board


  def initialize
    self.posx = 0
    self.posy = 0
    self.new_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def self.show_board
    new_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    3.times do |y|
      3.times { |x| print new_board[x][y] } # 'vertical printing'
      puts
    end
  end

  def finding(move)
    p move
    p new_board
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