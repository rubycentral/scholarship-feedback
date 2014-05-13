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

FactoryGirl.define do
  factory :event do
    name { "#{Faker::Name.last_name}Conf" }
    description { "#{Faker::Company.bs} 2.0" }
    start_date { rand(20).days.from_now }
    end_date { (20 + rand(3)).days.from_now }
  end
end
