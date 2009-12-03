class CreateUserInGroup < ActiveRecord::Migration
  def self.up
    create_table :user_in_group do |t|
      t.belongs_to :user
      t.belongs_to :exercise_group
      t.timestamps
    end
  end

  def self.down
    drop_table :user_in_group
  end
end
