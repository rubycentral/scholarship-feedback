# == Schema Information
#
# Table name: attendees
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  type                   :string(255)      not null
#  scholar_id             :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_attendees_on_email                 (email) UNIQUE
#  index_attendees_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'spec_helper'

describe Guide do
  it { should belong_to(:scholar) }
  it { should be_guide }

  describe '#scholar_name' do
    let!(:scholar) { create(:scholar, name: 'pants') }

    subject(:guide) { create(:guide, scholar: scholar) }

    its(:scholar_name) { should == 'pants' }
  end
end
