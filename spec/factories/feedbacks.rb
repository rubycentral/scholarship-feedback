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
#

FactoryGirl.define do
  factory :feedback do
    attendee
    testimonial { Faker::Company.bs }
    private_feedback { Faker::Company.bs }
  end
end
