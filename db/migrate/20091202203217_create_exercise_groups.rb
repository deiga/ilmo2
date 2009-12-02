class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.belongs_to :course_instance
      t.string :weekday
      t.string :time_of_day
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
