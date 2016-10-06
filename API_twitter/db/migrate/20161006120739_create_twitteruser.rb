class CreateTwitteruser < ActiveRecord::Migration
  def change
    create_table :twitterusers do |t|
      t.string :name
      t.timestamps
    end
  end
end
