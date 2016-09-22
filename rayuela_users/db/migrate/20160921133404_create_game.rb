class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :result1, null: false
      t.integer :result2, null: false
      t.string :winner
      t.timestamps
    end
  end
end
