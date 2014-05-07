# == Schema Information
#
# Table name: attendees
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  type                   :string(255)      not null
#  scholar_id             :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
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
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  invitations_count      :integer          default(0)
#  provider               :string(255)
#  uid                    :string(255)
#
# Indexes
#
#  index_attendees_on_email                 (email) UNIQUE
#  index_attendees_on_invitation_token      (invitation_token) UNIQUE
#  index_attendees_on_invitations_count     (invitations_count)
#  index_attendees_on_invited_by_id         (invited_by_id)
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
