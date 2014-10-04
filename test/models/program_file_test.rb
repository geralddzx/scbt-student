# == Schema Information
#
# Table name: program_files
#
#  id             :integer          not null, primary key
#  program_id     :string(255)      not null
#  file_file_name :string(255)      not null
#  file_file_size :string(255)      not null
#  created_at     :datetime
#

require 'test_helper'

class ProgramFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
