class Board
  attr_accessor :board

  def initialize
    @board = [[0, 0, 0, 0, 1, 0, 0, 0], # 0
              [0, 0, 0, 0, 0, 0, 0, 0], # 1
              [0, 0, 0, 0, 0, 0, 0, 0], # 2
              [1, 0, 0, 1, 0, 0, 0, 0], # 3
              [0, 0, 0, 0, 0, 0, 0, 0], # 4
              [0, 0, 0, 0, 0, 0, 0, 0], # 5
              [0, 0, 0, 0, 0, 0, 0, 0], # 6
              [0, 0, 0, 0, 0, 0, 0, 0]] # 7
            #  0  1  2  3  4  5  6  7
  end

  # This method designates direction (horizontal, vertical, diagonal).
  def is_obstructed?(x1, x2, y1, y2)
    if x1 == x2
      vert_obstruct?(x1, x2, y1, y2)
    elsif y1 == y2
      hori_obstruct?(x1, x2, y1, y2)
    else
      diag_obstruct?(x1, x2, y1, y2)
    end
  end

  # This method will check vertically from either end of the board.
  def vert_obstruct?(x1, x2, y1, y2)
    if y1 > y2
      while y2 < y1 do
        if board[x1][y2 - 1] != 0
          return true
        end
        y2 -= 1
      end
    else
      while y1 < y2 do
        if board[x1][y1 + 1] != 0 && y1 + 1 != 8
          return true
        end
        y1 += 1
      end
    end
  end

  # This method will check horizontally from either end of the bord.
  def hori_obstruct?(x1, x2, y1, y2)
    if x1 > x2
      while x2 < x1 do
        if board[x2 - 1][y1] != 0
          return true
        end
        x2 -= 1
      end
    else
      while x1 < x2 do
        if board[x1 + 1][y1] != 0 && x1 + 1 != 8
          return true
        end
        x1 += 1
      end
    end
  end

  # This method will check from either end diagonally.
  def diag_obstruct?(x1, x2, y1, y2)
    if x1 > x2 && y1 > y2
      while x2 < x1 do
        if board[x2 - 1][y2 - 1] != 0
          return true
        end
        x2 -= 1
        y2 -= 1
      end
    else
      while x1 < x2 && y1 < y2
        if board[x1 + 1][y1 + 1] != 0 && x1 + 1 != 8 && y1 + 1 != 8
          return true
        end
        x1 += 1
        y1 += 1
      end
    end
  end

  def is_occupied(x, y)
    if board[x][y] != 0
      return true
    else
      return false
    end
  end

end

b = Board.new

puts "Is_Obstructed?"
puts "Test Vertical top to bottom: #{b.is_obstructed?(0, 0, 1, 6)}"
puts "Test Vertical bottom to top: #{b.is_obstructed?(0, 0, 6, 1)}"
puts "Test Horizontal left to right: #{b.is_obstructed?(1, 6, 0, 0)}"
puts "Test Horizontal right to left: #{b.is_obstructed?(6, 1, 0, 0)}"
puts "Test Diagonal top to bottom: #{b.is_obstructed?(1, 6, 1, 6)}"
puts "Test Diagonal bottom to top: #{b.is_obstructed?(6, 1, 6, 1)}"