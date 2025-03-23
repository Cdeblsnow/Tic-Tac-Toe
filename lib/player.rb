require "colorize"
class Player
  attr_reader :player_mark, :player_points, :name

  @@player_id = 0

  def initialize
    @@player_id += 1
    @name = "Player#{@@player_id}"
    @player_mark = (@@player_id == 1 ? "X".colorize(:red) : "O".colorize(:blue))
    @player_points = 0
  end

  def add_point
    @player_points += 1
  end

  def self.id_reset
    @@player_id = 0
  end
end
