require_relative "../lib/board"

describe Board do
  describe "#finding" do
    subject(:board_find) { described_class.new }

    it "it changes y position if the move is valid" do
      board_find.finding(6)
      expect(board_find.instance_variable_get(:@posy)).to eq(2)
    end

    it "it changes x position if the move is valid" do
      board_find.finding(6)
      expect(board_find.instance_variable_get(:@posx)).to eq(1)
    end

    it "it does not changes y position if the move is invalid" do
      board_find.finding(33)
      expect(board_find.instance_variable_get(:@posy)).to eq(0)
    end

    it "it does not changes x position if the move is invalid" do
      board_find.finding(33)
      expect(board_find.instance_variable_get(:@posx)).to eq(0)
    end
  end

  describe "#reset_board" do
    subject(:board_reset) { described_class.new }
    before do
      3.times do |i|
        board_reset.instance_variable_get(:@new_board)[i][0] = "p"
      end
    end

    it "reset the changed board" do
      board_reset.reset_board
      expect(board_reset.instance_variable_get(:@new_board)).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe "#transform_board" do
    subject(:board_transform) { described_class.new }
    before do
      board_transform.instance_variable_set(:@posy, 1)
      board_transform.instance_variable_set(:@posx, 0)
    end

    it "modifies the board when turn is odd" do
      board_transform.transform_board("X", "Y", 1)
      expect(board_transform.new_board).to eq([[1, "Y", 3], [4, 5, 6], [7, 8, 9]])
    end

    it "modifies the board when turn is even" do
      board_transform.transform_board("X", "Y", 2)
      expect(board_transform.new_board).to eq([[1, "X", 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe "#horizontal_win?" do
    subject(:board_horizontal) { described_class.new }

    it "returns true when three 'consecutive' horizontal tiles are the same" do
      board_horizontal.instance_variable_set(:@new_board, [["X", 2, 3], ["X", 5, 6], ["X", 8, 9]])

      expect(board_horizontal.horizontal_win?).to eq(true)
    end
  end

  describe "#vertical_win?" do
    subject(:board_vertical) { described_class.new }

    it "returns true when three 'vertical' horizontal tiles are the same" do
      board_vertical.instance_variable_set(:@new_board, [%w[Y Y Y], [4, 5, 6], [7, 8, 9]])

      expect(board_vertical.vertical_win?).to eq(true)
    end
  end

  describe "#down_right_diagonal_win?" do
    subject(:board_diagonal) { described_class.new }

    it "returns true when three diagonal, left to right, tiles are the same" do
      board_diagonal.instance_variable_set(:@new_board, [["X", 2, 3], [4, "X", 6], [7, 8, "X"]])

      expect(board_diagonal.down_right_diagonal_win?).to eq(true)
    end
  end

  describe "#down_left_diagonal_win?" do
    subject(:board_diagonal) { described_class.new }

    it "returns true when three diagonal, right to left, tiles are the same" do
      board_diagonal.instance_variable_set(:@new_board, [[1, 2, "X"], [4, "X", 6], ["X", 8, 9]])

      expect(board_diagonal.down_left_diagonal_win?).to eq(true)
    end
  end
end
