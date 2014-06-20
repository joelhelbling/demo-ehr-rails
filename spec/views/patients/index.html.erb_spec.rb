require 'rails_helper'

RSpec.describe "patients/index", :type => :view do
  before(:each) do
    assign(:patients, [
      Patient.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :date_of_birth => "10/11/1971",
        :state => "OH"
      ),
      Patient.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :date_of_birth => "10/11/1971",
        :state => "OH"
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", :text => "First Name Last Name (10/11/1971)", :count => 2
  end
end
