class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string :name
      t.integer :x_coord
      t.integer :y_coord
      t.integer :game_id
      t.integer :user_id
      t.timestamps
    end
  end
end
