class RemoveTypeFromAttendees < ActiveRecord::Migration
  class Attendee20140513192255 < ActiveRecord::Base
    self.table_name = :attendees
  end

  class ScholarshipGuide20140513192255 < ActiveRecord::Base
    self.table_name = :scholarship_guides
  end

  def up
    remove_column :attendees, :type
  end

  def down
    add_column :attendees, :type, :string

    Attendee20140513192255.all.to_a.each do |attendee|
      is_guide = ScholarshipGuide20140513192255.where(attendee_id: attendee.id).count > 0
      attendee.update_column(:type, is_guide ? 'Guide' : 'Scholar')
    end

    change_column :attendees, :type, :string, null: false
  end
end
