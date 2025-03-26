require_relative "../lib/player"
require "colorize"

describe Player do # rubocop:disable Metrics/BlockLength
  before(:all) do
    @player1 = described_class.new
    @player2 = described_class.new
  end

  describe "#initialize" do
    context "when player one is created" do
      it "its name is player 1" do
        expect(@player1.name).to eq("Player1")
      end

      it "has zero points" do
        expect(@player1.player_points).to eq(0)
      end

      it "its mark is X" do
        expect(@player1.player_mark).to eq("X".colorize(:red))
      end
    end

    context "when player two is created" do
      it "its name is player 2" do
        expect(@player2.name).to eq("Player2")
      end

      it "has zero points" do
        expect(@player2.player_points).to eq(0)
      end

      it "its mark is O" do
        expect(@player2.player_mark).to eq("O".colorize(:blue))
      end
    end
  end

  describe "#add_point" do
    context "when player 1 wins" do
      it "increase its points by 1" do
        @player1.add_point
        expect(@player1.player_points).to eq(1)
      end
    end

    context "when player 2 wins" do
      it "increase its points by 1" do
        @player2.add_point
        expect(@player2.player_points).to eq(1)
      end
    end
  end

  describe ".id_reset" do
    context "when the called"
    let(:player) { described_class.new } # create first an instance of player to increase id count
    it "reset player id" do
      expect(Player.id_reset).to eq(0)
    end
  end
end
