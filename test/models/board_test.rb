require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  setup :initialize_board
  teardown :cleanup_board

  test 'Initializes a array with 9 spaces' do
    assert_equal(@board.spaces.flatten.size, 9)
  end

  test 'space is open' do
    assert(@board.space_open?(0, 0))
  end

  test 'space is taken' do
    @board.spaces[0][0] = 'X'
    assert_not(@board.space_open?(0, 0))
  end

  test 'Full? is true when all spaces are filled' do
    fill_board
    assert(@board.full?)
  end

  test 'Board is not full' do
     assert_not(@board.full?)
  end

  private

  def initialize_board
    @board = Board.new
  end

  def cleanup_board
    @board = nil
  end

  def fill_board
    @board.spaces.each_with_index do |row, row_index|
      row.each_with_index do |_colunm, column_index|
        @board.spaces[row_index][column_index] = 'X'
      end
    end 
  end
end
