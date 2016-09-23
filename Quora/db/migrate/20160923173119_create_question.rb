class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
