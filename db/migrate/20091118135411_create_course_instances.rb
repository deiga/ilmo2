class CreateCourseInstances < ActiveRecord::Migration
  def self.up
    create_table :course_instances do |t|
      t.string :season
      t.integer :year, :default => Time.now.year
      t.text :description
      t.belongs_to :course, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :course_instances
  end
end
