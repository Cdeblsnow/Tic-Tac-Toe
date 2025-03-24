require_relative "../lib/game"

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
end
