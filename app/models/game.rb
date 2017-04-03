class Game < ApplicationRecord

  attr_accessor :board, :players, :current_player, :other_player

  after_initialize :setup_new_game

  def setup_new_game
    self.board = Board.new
    create_players
    set_default_current_player
  end

  def create_players(number_of_players = 2)
    @players = []
    number_of_players.times do |i|
      marker = available_markers[rand(available_markers.size)]
      @players << Player.new(marker, "Player #{i + 1}")
    end
  end

  def set_default_current_player
    @current_player, @other_player = players[0], players[1]
  end

  def markers_directory
    Rails.root.join('app', 'assets', 'images', 'markers') 
  end

  def available_markers
    all_markers = Dir["#{markers_directory}/*.svg"].map { |f| File.basename f }
    all_markers - used_markers
  end

  def used_markers
    players.map(&:marker)
  end
   
  def over?
    winner? || draw?
  end

  def winner?
    board.winning_combinations.each do |combo|
      if combo.uniq.length == 1
        return combo unless combo.all?(&:nil?)
      end
    end
    false
  end

  def draw?
    board.full?
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end
end
