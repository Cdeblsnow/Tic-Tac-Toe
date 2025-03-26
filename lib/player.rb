require "colorize"
class Player
  attr_reader :player_mark, :name, :player_points

  def initialize(id)
    @name = "Player#{id}"
    @player_mark = (id == 1 ? "X".colorize(:red) : "O".colorize(:blue))
    @player_points = 0
  end

  def add_point
    @player_points += 1
  end
end
