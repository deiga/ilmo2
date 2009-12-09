class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.belongs_to :course_instance
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
