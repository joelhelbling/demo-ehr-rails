require 'rails_helper'

RSpec.describe "patients/show", :type => :view do
  before(:each) do
    @patient = assign(:patient, Patient.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :date_of_birth => "Date Of Birth",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Date Of Birth/)
    expect(rendered).to match(/State/)
  end
end
