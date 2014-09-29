# == Schema Information
#
# Table name: program_files
#
#  id                :integer          not null, primary key
#  program_id        :string(255)      not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  file_name         :string(255)      not null
#

require 'test_helper'

class ProgramFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
