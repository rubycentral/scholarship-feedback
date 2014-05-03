# == Schema Information
#
# Table name: admins
#
#  id                 :integer          not null, primary key
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable
end
