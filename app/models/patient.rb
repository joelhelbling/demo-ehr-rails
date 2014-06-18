class Patient < ActiveRecord::Base
	has_many :prescriptions
	validates_presence_of :first_name, :last_name, :state
	validates :date_of_birth, :presence => true, :format => {with: /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/, message: "must be DD/MM/YYYY"}

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
