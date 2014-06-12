require 'rails_helper'

RSpec.describe "patients/index", :type => :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :date_of_birth => "Date Of Birth",
        :state => "State"
      ),
      Patient.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :date_of_birth => "Date Of Birth",
        :state => "State"
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Date Of Birth".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
