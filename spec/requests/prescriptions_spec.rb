require 'rails_helper'

RSpec.describe "Prescriptions", :type => :request do
  describe "GET /prescriptions" do
    it "works! (now write some real specs)" do
      get prescriptions_path
      expect(response.status).to be(200)
    end
  end
end
