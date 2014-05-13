# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  start_date  :datetime
#  end_date    :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Event do
  it { should have_many(:scholarships) }
  it { should have_many(:scholarship_guides) }
  it { should have_many(:feedbacks) }

  it { should validate_uniqueness_of(:name) }
end
