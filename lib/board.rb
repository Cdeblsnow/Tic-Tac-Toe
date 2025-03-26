class Board
  attr_reader :new_board

  def initialize
    @posx = 0
    @posy = 0
    @new_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show_board
    3.times do |y|
      3.times { |x| print @new_board[x][y] } # 'vertical printing'
      puts
    end
  end

  def finding(move)
    return unless move.between?(1, 9)

    3.times do |x|
      3.times do |y|
        next unless @new_board[x][y] == move # check for the index of the object if valid

        @posx = x
        @posy = y
        return # rubocop:disable Lint/NonLocalExitFromIterator
      end
    end
  end

  def reset_board
    @new_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # reset and create the board we will be working with
  end

  def transform_board(mark1, mark2, turn)
    x = @posx
    y = @posy
    return "Space has already been taken" unless @new_board[x][y] != mark1 && @new_board[x][y] != mark2

    @new_board[x][y] = if turn.even?
                         mark1
                       else
                         mark2
                       end
    show_transformed_board
  end

  def horizontal_win?
    3.times do |place|
      mark = @new_board[0][place]
      return true if @new_board.all? { |row| row[place] == mark }
    end
    false
  end

  def vertical_win?
    3.times do |column|
      mark = @new_board[column][0]
      return true if @new_board[column].all? { |tile| tile == mark }
    end
    false
  end

  def down_right_diagonal_win?
    2.times do |i|
      return false unless @new_board[i - 1][i - 1] == @new_board[i][i]
    end
    true
  end

  def down_left_diagonal_win?
    2.times do |i|
      return false unless @new_board[i][2 - i] == @new_board[i + 1][1 - i]
    end
    true
  end

  private

  def show_transformed_board
    3.times do |y|
      3.times { |x| print @new_board[x][y] } # 'vertical printing'
      puts
    end
  end
end
