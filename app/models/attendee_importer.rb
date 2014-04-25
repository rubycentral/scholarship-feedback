require 'csv'

class AttendeeImporter < Struct.new(:content)
  class ScholarshipPresenter < Struct.new(:row)
    def scholar
      scholar = Scholar.find_or_initialize_by(name: row[:scholar_name], email: row[:scholar_email])
      scholar.password = scholar.password_confirmation = SecureRandom.base64 unless scholar.id
      scholar
    end

    def first_guide
      guide = Guide.find_or_initialize_by(name: row[:guide_1_name], email: row[:guide_1_email], scholar: scholar)
      guide.password = guide.password_confirmation = SecureRandom.base64 unless guide.id
      guide
    end

    def second_guide
      guide = Guide.find_or_initialize_by(name: row[:guide_2_name], email: row[:guide_2_email], scholar: scholar)
      guide.password = guide.password_confirmation = SecureRandom.base64 unless guide.id
      guide
    end

    def valid?
      to_a.all?(&:valid?)
    end

    def save
      to_a.each(&:save)
    end

    protected

    def to_a
      attendees = [scholar, first_guide]
      attendees << second_guide if row[:guide_2_name].present? || row[:guide_2_email].present?
      attendees
    end
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
