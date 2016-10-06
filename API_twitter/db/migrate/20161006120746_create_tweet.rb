class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.belongs_to :twitteruser
      t.timestamps
    end
  end
end
