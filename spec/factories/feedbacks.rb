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

FactoryGirl.define do
  factory :feedback do
    event
    attendee
    testimonial { Faker::Company.bs }
    private_feedback { Faker::Company.bs }
  end
end
