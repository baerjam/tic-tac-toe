require 'test_helper'

class GameTest < ActiveSupport::TestCase
  setup :initialize_game
  teardown :cleanup_game

  test 'digonals 1 produce a winner' do
    @game.board.make_move(0, 0, 'X')
    @game.board.make_move(1, 1, 'X')
    @game.board.make_move(2, 2, 'X')
    assert(@game.winner?)
  end

  test 'digonals 2 produce a winner' do
    @game.board.make_move(2, 0, 'X')
    @game.board.make_move(1, 1, 'X')
    @game.board.make_move(0, 2, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'top row produce a winner' do
    @game.board.make_move(0, 0, 'X')
    @game.board.make_move(0, 1, 'X')
    @game.board.make_move(0, 2, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'middle row produce a winner' do
    @game.board.make_move(1, 0, 'X')
    @game.board.make_move(1, 1, 'X')
    @game.board.make_move(1, 2, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'bottom row produce a winner' do
    @game.board.make_move(2, 0, 'X')
    @game.board.make_move(2, 1, 'X')
    @game.board.make_move(2, 2, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'first column produce a winner' do
    @game.board.make_move(0, 0, 'X')
    @game.board.make_move(1, 0, 'X')
    @game.board.make_move(2, 0, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'second column produce a winner' do
    @game.board.make_move(0, 1, 'X')
    @game.board.make_move(1, 1, 'X')
    @game.board.make_move(2, 1, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'third column produce a winner' do
    @game.board.make_move(0, 2, 'X')
    @game.board.make_move(1, 2, 'X')
    @game.board.make_move(2, 2, 'X')
    assert(@game.over?)
    assert(@game.winner?)
  end

  test 'game not won' do
    @game.board.make_move(2, 0, 'X')
    assert_not(@game.winner?)
    assert_not(@game.over?) 
  end   

  test 'game is not over' do
    assert_not(@game.over?) 
  end

  test 'game ends in a draw' do
    @game.board.make_move(0, 0, 'X')
    @game.board.make_move(0, 1, 'O')
    @game.board.make_move(0, 2, 'X')
    @game.board.make_move(1, 0, 'O')
    @game.board.make_move(1, 1, 'O')
    @game.board.make_move(1, 2, 'X')
    @game.board.make_move(2, 0, 'X') 
    @game.board.make_move(2, 1, 'X') 
    @game.board.make_move(2, 2, 'O') 
    
    assert(@game.over?) 
    assert(@game.draw?) 
  end 

  test 'player 1 is the current player to start the game' do
    assert_equal(@game.current_player, @game.players[0])
  end

  test 'switch players changes the current player' do
    @game.switch_players
    assert_not_equal(@game.current_player, @game.players[0])
  end 

  test 'two players created' do
    assert_equal(@game.players.size, 2)
  end   

  private

  def initialize_game
    @game = Game.new
  end

  def cleanup_game
    @game = nil
  end
end
