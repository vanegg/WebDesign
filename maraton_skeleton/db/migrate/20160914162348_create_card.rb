class CreateCard < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.string :fake_answer1
      t.string :fake_answer2
      t.belongs_to :deck
      t.timestamps
    end
  end
end
