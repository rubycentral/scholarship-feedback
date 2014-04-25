class CreateFeedback < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :attendee_id, null: false

      t.text :testimonial
      t.text :private_feedback

      t.timestamps
    end
  end
end
