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

require 'spec_helper'

describe Scholarship do
  it { should belong_to(:event) }
  it { should belong_to(:attendee) }
  it { should have_many(:scholarship_guides) }
end
