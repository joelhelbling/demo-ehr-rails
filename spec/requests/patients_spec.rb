require 'rails_helper'

RSpec.describe "Patients", :type => :request do
  describe "GET /patients" do
    it "works! (now write some real specs)" do
      get patients_path
      expect(response.status).to be(200)
    end
  end
end
