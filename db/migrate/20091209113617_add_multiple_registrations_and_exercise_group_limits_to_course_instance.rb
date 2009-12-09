class AddMultipleRegistrationsAndExerciseGroupLimitsToCourseInstance < ActiveRecord::Migration
  def self.up
    add_column :course_instances, :min_exercise_groups, :integer
    add_column :course_instances, :max_exercise_groups, :integer
  end

  def self.down
    remove_column :course_instances, :max_exercise_groups
    remove_column :course_instances, :min_exercise_groups
  end
end
