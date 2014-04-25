require 'spec_helper'

describe 'import' do
  before do
    Rake.application.rake_require 'tasks/import'
    Rake::Task.define_task(:environment)
  end

  describe 'import:attendees' do
    before do
      Rake::Task['import:attendees'].reenable
    end

    def run_rake_task(path = nil)
      Rake.application.invoke_task("import:attendees[#{path}]")
    end

    it 'creates a scholar' do
      expect {
        run_rake_task(Rails.root.join('spec/support/fixtures/attendee.csv'))
      }.to change(Scholar, :count).by(1)
    end

    it 'creates a guide' do
      expect {
        run_rake_task(Rails.root.join('spec/support/fixtures/attendee.csv'))
      }.to change(Guide, :count).by(1)
    end
  end
end
