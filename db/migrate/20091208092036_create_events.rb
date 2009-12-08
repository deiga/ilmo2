class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :type
      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
