# == Schema Information
#
# Table name: scholarships
#
#  id          :integer          not null, primary key
#  attendee_id :integer          not null
#  event_id    :integer          not null
#  approved    :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Scholarship < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :event
  has_many :scholarship_guides
end
