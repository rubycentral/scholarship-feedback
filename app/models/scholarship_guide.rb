# == Schema Information
#
# Table name: scholarship_guides
#
#  id             :integer          not null, primary key
#  attendee_id    :integer          not null
#  event_id       :integer          not null
#  scholarship_id :integer
#  approved       :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#

class ScholarshipGuide < ActiveRecord::Base
end
