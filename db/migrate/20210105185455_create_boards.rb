class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.text :template, array: true, default: []
      t.integer :counter
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
