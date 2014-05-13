class RemoveScholarIdFromAttendees < ActiveRecord::Migration
  class Attendee20140513180249 < ActiveRecord::Base
    self.table_name = :attendees
  end

  class Scholarship20140513180249 < ActiveRecord::Base
    self.table_name = :scholarships
  end

  class ScholarshipGuide20140513180249 < ActiveRecord::Base
    self.table_name = :scholarship_guides
  end

  class Event20140513180249 < ActiveRecord::Base
    self.table_name = :events
  end

  def up
    event = Event20140513180249.find_or_create_by!(name: "RailsConf 2014")

    Attendee20140513180249.where(scholar_id: nil).each do |scholar|
      scholarship = Scholarship20140513180249.find_or_create_by!(
        event_id: event.id,
        attendee_id: scholar.id,
        approved: true
      )

      Attendee20140513180249.where(scholar_id: scholar.id).each do |guide|
        ScholarshipGuide20140513180249.find_or_create_by!(
          event_id: event.id,
          attendee_id: guide.id,
          scholarship_id: scholarship.id,
          approved: true
        )
      end
    end

    remove_column :attendees, :scholar_id
  end

  def down
    add_column :attendees, :scholar_id, :integer

    ScholarshipGuide20140513180249.all.to_a.each do |scholarship_guide|
      guide = Attendee20140513180249.find(scholarship_guide.attendee_id)
      scholarship = Scholarship20140513180249.find(scholarship_guide.scholarship_id)
      guide.update_column(:scholar_id, scholarship.attendee_id)
    end
  end
end
