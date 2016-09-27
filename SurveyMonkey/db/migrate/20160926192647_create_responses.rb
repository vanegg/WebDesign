class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :option
      t.belongs_to :user
      t.belongs_to :survey
      t.belongs_to :question
      t.timestamps
    end
  end
end
