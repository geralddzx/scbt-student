# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  permission      :string(255)      not null
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  street          :string(255)
#  city            :string(255)
#  country         :string(255)
#  postal_code     :string(255)
#  phone           :integer
#  referral        :string(255)
#  photo_url       :string(255)
#  survey_id       :integer
#  activation_code :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
