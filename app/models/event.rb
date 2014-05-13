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

class Event < ActiveRecord::Base
  has_many :scholarships
  has_many :scholarship_guides
  has_many :feedbacks

  validates_uniqueness_of :name, case_insensitive: true
end
