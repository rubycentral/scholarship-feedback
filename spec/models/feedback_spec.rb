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

require 'spec_helper'

describe Feedback do
  it { should belong_to(:attendee) }
  it { should belong_to(:event) }

  it { should validate_presence_of(:attendee) }
  it { should validate_presence_of(:event) }
  it { should validate_uniqueness_of(:attendee_id).scoped_to(:event_id) }
end
