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

class Profile < ActiveRecord::Base
	belongs_to :user

	# validates_presence_of :first_0name
	# validates_presence_of :last_name

	def fullname
		first_name.to_s + " " + last_name
	end
end
