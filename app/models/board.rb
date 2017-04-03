class Board
  attr_reader :spaces

  def initialize
    @spaces = Array.new(3) { Array.new(3) }
  end

  def space_open?(row, col)
    @spaces[row][col].nil?
  end

  def valid_move?(row, col)
    space_open?(row, col) && (0..2).include?(row) && (0..2).include?(col)
  end

  def make_move(row, col, marker)
    if space_open?(row, col)    
      @spaces[row][col] = marker 
    end
  end

  def full?
    spaces.flatten.all? { |e| !e.nil? }
  end

  def winning_combinations
    rows + columns + diagonals
  end

  def rows
    spaces
  end

  def columns
    spaces.transpose
  end

  def diagonals
    [
      [spaces[0][0], spaces[1][1], spaces[2][2]],
      [spaces[2][0], spaces[1][1], spaces[0][2]],  
    ]
  end
end