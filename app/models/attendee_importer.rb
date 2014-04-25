require 'csv'

class AttendeeImporter < Struct.new(:content)
  class ScholarshipPresenter < Struct.new(:row)
    def scholar
      scholar = Scholar.find_or_initialize_by(name: row[:scholar_name], email: row[:scholar_email])
      scholar.password = scholar.password_confirmation = SecureRandom.base64 unless scholar.id
      scholar
    end

    def first_guide
      guide = Guide.find_or_initialize_by(name: row[:guide_1_name], email: row[:guide_1_email])
      guide.scholar = scholar
      guide.password = guide.password_confirmation = SecureRandom.base64 unless guide.id
      guide
    end

    def second_guide
      guide = Guide.find_or_initialize_by(name: row[:guide_2_name], email: row[:guide_2_email])
      guide.scholar = scholar
      guide.password = guide.password_confirmation = SecureRandom.base64 unless guide.id
      guide
    end

    def valid?
      if has_second_guide?
        scholar.valid? && first_guide.valid? && second_guide.valid?
      else
        scholar.valid? && first_guide.valid?
      end
    end

    def save
      scholar.save!
      first_guide.scholar = scholar
      first_guide.save!
      if has_second_guide?
        second_guide.scholar = scholar
        second_guide.save!
      end
    end

    protected

    def has_second_guide?
      row[:guide_2_name].present? || row[:guide_2_email].present?
    end
  end

  def self.import_file(path)
    new(File.read(path)).save
  end

  def has_valid_headers?
    missing_headers.empty?
  end

  def valid?
    has_valid_headers? && scholarships.all?(&:valid?)
  end

  def save
    scholarships.each(&:save) if valid?
  end

  protected

  def scholarships
    @scholarships ||= entries.map { |e| ScholarshipPresenter.new(e) }
  end

  def missing_headers
    %w[
    scholar_name scholar_email
    guide_1_name guide_1_email
    guide_2_name guide_2_email
  ].map(&:to_sym) - headers
  end

  def headers
    entries.first.headers
  end

  def entries
    @entries ||= CSV.new(content, headers: true, header_converters: :symbol).entries
  end
end
