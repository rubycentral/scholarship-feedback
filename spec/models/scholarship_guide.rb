require 'spec_helper'

describe ScholarshipGuide do
  it { should belong_to(:event) }
  it { should belong_to(:attendee) }
  it { should belong_to(:scholarship) }
end
