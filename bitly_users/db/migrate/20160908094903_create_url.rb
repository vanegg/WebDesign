class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.belongs_to :user
      t.string :long_url
      t.string :short_url
      t.integer :click_count, :default => 0
      t.timestamps
    end
  end
end



