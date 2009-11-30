class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.belongs_to :course_instance, :null => false
      t.string :class
      t.string :weekday, :limit => 3
      t.string :time_of_day
      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end