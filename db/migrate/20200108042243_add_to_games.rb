class AddToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :whitePlayerID, :integer
    add_column :games, :blackPlayerID, :integer
  end
end
