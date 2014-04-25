require 'spec_helper'

describe AttendeeImporter do
  let(:valid_content) { Rails.root.join('spec/support/fixtures/attendee.csv').read }
  let(:multiple_guides) { Rails.root.join('spec/support/fixtures/attendee_with_two_guides.csv').read }
  let(:invalid_content) { Rails.root.join('spec/support/fixtures/invalid_attendee.csv').read }
  let(:invalid_headers) { Rails.root.join('spec/support/fixtures/invalid_attendee_headers.csv').read }

  subject(:importer) { AttendeeImporter.new(valid_content) }

  describe '#has_valid_headers?' do
    context 'with valid headers' do
      it { should have_valid_headers }
    end

    context 'with invalid headers' do
      subject(:importer) { AttendeeImporter.new(invalid_headers) }

      it { should_not have_valid_headers }
    end
  end

  describe '#valid?' do
    context 'with valid data' do
      it { should be_valid }
    end

    context 'with invalid data' do
      subject(:importer) { AttendeeImporter.new(invalid_content) }

      it { should_not be_valid }
    end
  end

  describe '#save' do
    context 'with valid data' do
      it 'creates a scholar' do
        expect { importer.save }.to change(Scholar, :count).by(1)
      end

      it 'creates a guide' do
        expect { importer.save }.to change(Guide, :count).by(1)
      end

      it 'sets the scholar for the guide' do
        importer.save
        expect(Guide.last.scholar).to eq(Scholar.last)
      end
    end

    context 'with multiple guides' do
      subject(:importer) { AttendeeImporter.new(multiple_guides) }

      it 'creates two guides' do
        expect { importer.save }.to change(Guide, :count).by(2)
      end
    end

    context 'with invalid data' do
      subject(:importer) { AttendeeImporter.new(invalid_content) }

      it 'does not create a guide' do
        expect { importer.save }.not_to change(Guide, :count)
      end

      it 'does not create a scholar' do
        expect { importer.save }.not_to change(Scholar, :count)
      end
    end
  end

  describe '.import_file' do
    it 'creates a scholar' do
      expect {
        AttendeeImporter.import_file(Rails.root.join('spec/support/fixtures/attendee.csv'))
      }.to change(Scholar, :count).by(1)
    end

    it 'creates a guide' do
      expect {
        AttendeeImporter.import_file(Rails.root.join('spec/support/fixtures/attendee.csv'))
      }.to change(Guide, :count).by(1)
    end
  end
end
