require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"

describe Game do
  describe "#initialize" do
    subject(:game_init) { described_class.new }

    it "starts with an empty move set" do
      expect(game_init.instance_variable_get(:@moves)).to be_empty
    end

    it "starts with an empty player one" do
      expect(game_init.first_player).to be_empty
    end

    it "starts with an empty player two" do
      expect(game_init.second_player).to be_empty
    end
  end

  describe "#add_move" do
    subject(:game_move_add) { described_class.new }

    it "adds numeric values" do
      game_move_add.add_move(1)
      expect(game_move_add.instance_variable_get(:@moves)).to include(1)
    end

    context "when the value is not a number" do
      it "it is not added" do
        game_move_add.add_move("f")
        expect(game_move_add.instance_variable_get(:@moves)).to_not include("f")
      end
    end
  end

  describe "#check_move" do
    subject(:game_check) { described_class.new }
    before do
      game_check.add_move(56)
    end

    it "returns true if the value is found" do
      expect(game_check.check_move(56)).to be(true)
    end

    it "returns false if the value is not found" do
      expect(game_check.check_move(36)).to be(false)
    end
  end

  describe "#game_over" do
    subject(:game_end) { described_class.new }
    let(:board_end) { Board.new }
    let!(:first_player) { Player.new(1) }
    let!(:second_player) { Player.new(2) }

    context "when player one wins" do
      before(:each) do
        game_end.instance_variable_set(:@first_player, first_player)
        game_end.instance_variable_set(:@second_player, second_player)
        3.times do |i|
          board_end.instance_variable_get(:@new_board)[i][0] = first_player.player_mark
        end
      end

      it "returns true when player one wins" do
        expect(game_end.game_over(board_end, 0)).to eq(true)
      end

      it "increase the player points by one after victory" do
        game_end.game_over(board_end, 0)
        expect(first_player.player_points).to eq(1)
      end
    end

    context "when player two wins" do
      before(:each) do
        game_end.instance_variable_set(:@first_player, first_player)
        game_end.instance_variable_set(:@second_player, second_player)
        3.times do |i|
          board_end.instance_variable_get(:@new_board)[i][0] = second_player.player_mark
        end
      end

      it "returns true when player two wins" do
        expect(game_end.game_over(board_end, 1)).to eq(true)
      end

      it "increase the player points by one after victory" do
        game_end.game_over(board_end, 1)
        expect(second_player.player_points).to eq(1)
      end
    end
  end
end
