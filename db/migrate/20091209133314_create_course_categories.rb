class CreateCourseCategories < ActiveRecord::Migration
  def self.up
    create_table :course_categories do |t|
      t.belongs_to :course
      t.belongs_to :category

      t.timestamps
    end
  end

  def self.down
    drop_table :course_categories
  end
end
