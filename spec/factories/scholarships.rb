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

FactoryGirl.define do
  factory :scholarship do
    attendee
    event
  end
end
