require 'spec_helper'

describe 'invite' do
  before do
    Rake.application.rake_require 'tasks/invite'
    Rake::Task.define_task(:environment)
  end

  describe 'invite:attendees' do
    let!(:guide) { create(:guide) }

    before do
      Rake::Task['invite:attendees'].reenable
    end

    def run_rake_task
      Rake.application.invoke_task("invite:attendees")
    end

    context 'when an attendee has not been invited' do
      it 'invites the attendee' do
        expect {
          run_rake_task
        }.to change { guide.reload.invitation_token }
      end
    end

    context 'when an attendee has already been invited' do
      before { guide.invite! }

      it 'does not reinvite the attendee' do
        expect {
          run_rake_task
        }.not_to change { guide.reload.invitation_token }
      end
    end
  end
end
