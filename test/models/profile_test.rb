# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  first_name :string(255)
#  last_name  :string(255)
#  dob        :date
#  website    :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
