require "colorize"
class Player
  attr_accessor :player_mark, :player_points, :number_of_moves, :name

  @@player_id = 0

  def initialize
    @@player_id += 1
    self.name = "Player#{@@player_id}"
    self.player_mark = (@@player_id == 1 ? "X".colorize(:red) : "O".colorize(:blue))
    self.player_points = 0
  end

  def show_player_id
    @@player_id
  end

  def add_point
    self.player_points += 1
  end

  def self.id_reset
    @@player_id = 0
  end
end