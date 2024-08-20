require_relative "player"
class Game
  def self.shuffle_players(p1, p2)
    playing_order = [p1, p2]
    playing_order = playing_order.shuffle
    @firstp = playing_order[0]
    @secondp = playing_order[1]
  end

  def self.player_creation
    Player.id_reset
    player1 = Player.new
    player2 = Player.new
    Game.shuffle_players(player1, player2)
  end

  def self.player1
    @firstp
  end

  def self.player2
    @secondp
  end
end