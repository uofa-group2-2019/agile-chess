class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :x_position
      t.integer :y_position
      t.integer :playerID
      t.integer :gameID
      t.string :piece_type

      t.timestamps
    end
  end
end
