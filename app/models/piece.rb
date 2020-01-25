class Piece < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def move_to!(new_x, new_y)
    # Check to see if there is a piece in the designated location.
    if is_occupied(new_x, new_y) #located in is_obstructed.rb
      if Piece.user_id != board[x][y].user_id 
        Piece.update_attributes(:x_coord => new_x, :y_coord => new_y
      else
        return "Cannot Capture pieces you own."
      end
    end
  end
end