# == Schema Information
#
# Table name: feedbacks
#
#  id               :integer          not null, primary key
#  attendee_id      :integer          not null
#  testimonial      :text
#  private_feedback :text
#  created_at       :datetime
#  updated_at       :datetime
#  event_id         :integer          not null
#

class Feedback < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :event

  validates :attendee, presence: true
  validates :event, presence: true
  validates_uniqueness_of :attendee_id, scope: :event_id
end
