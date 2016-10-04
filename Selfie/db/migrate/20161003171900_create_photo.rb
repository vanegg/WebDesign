class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.belongs_to :album
      t.timestamps
    end
  end
end
