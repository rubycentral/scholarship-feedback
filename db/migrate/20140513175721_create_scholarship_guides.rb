class CreateScholarshipGuides < ActiveRecord::Migration
  def change
    create_table :scholarship_guides do |t|
      t.integer :attendee_id, null: false
      t.integer :event_id, null: false
      t.integer :scholarship_id, null: true
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
