class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.integer :attendee_id, null: false
      t.integer :event_id, null: false
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
