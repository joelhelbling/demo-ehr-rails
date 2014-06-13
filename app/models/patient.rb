class Patient < ActiveRecord::Base
	has_many :prescriptions

	def name
		"#{first_name} #{last_name}"
	end
end
