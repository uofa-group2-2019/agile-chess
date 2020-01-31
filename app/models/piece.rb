class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def contains_own_piece?(x_end, y_end)
    piece = game.pieces.where("x_coord = ? AND y_coord = ?", x_end, y_end).first
    piece.present? && piece.white == white
  end

  def opposition_piece?(x_end, y_end, id = nil, color = nil)
    piece = game.pieces.where("x_coord = ? AND y_coord = ?", x_end, y_end).first
    if id == nil
      if piece.blank?
        return false
      elsif piece.white != white
        return true
      elsif piece.white == white
        return false
      end
    elsif self.id == id && piece.blank? #empty square
      return false
    elsif self.id == id && piece.white != white #the piece is moving into square that has a opposite piece
      return true
    elsif self.id != id && self.white != color # ex: King moving to square above pawn, and when performing king.check?, pawn will recognize there is an opposition piece, making the vertical move false
      return true
    else
      return false
    end
  end

  def is_obstructed(x_end, y_end)
    obstruction_array = build_obstruction_array(x_end, y_end)
    # Check if end square contains own piece and if any of in between squares have a piece of any colour in
    obstruction_array.any?{|square| game.contains_piece?(square[0], square[1]) == true}
  end

  # determines horizontal distance travelled by piece
  def x_distance(new_x_coord)
    x_distance = (new_x_coord - x_coord).abs
  end

  # determines vertical distance travelled by piece
  def y_distance(new_y_coord)
    y_distance = (new_y_coord - y_coord).abs
  end

  # returns true if piece is moving from bottom to top
  def up?(new_y_coord)
    (y_coord - new_y_coord) > 0
  end

  # returns true if piece is moving from top to bottom
  def down?(new_y_coord)
    (y_coord - new_y_coord) < 0
  end

  def diagonal?(x_distance, y_distance)
    x_distance == y_distance
  end
end