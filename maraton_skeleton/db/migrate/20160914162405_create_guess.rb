class CreateGuess < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :tries
      t.boolean :result
      t.belongs_to :round
      t.timestamps
    end
  end
end
