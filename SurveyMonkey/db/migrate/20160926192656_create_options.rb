class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :text
      t.belongs_to :question
      t.timestamps
    end
  end
end
