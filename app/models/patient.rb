class Patient < ActiveRecord::Base
	has_many :prescriptions

	def name
		"#{first_name} #{last_name}"
	end

	def requests
		num_requests = 0
		prescriptions.each do |p|
			num_requests += p.pa_requests.count
		end
		num_requests
	end
end
