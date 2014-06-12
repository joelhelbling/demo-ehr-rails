require 'rails_helper'

RSpec.describe "patients/new", :type => :view do
  before(:each) do
    assign(:patient, Patient.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :date_of_birth => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new patient form" do
    render

    assert_select "form[action=?][method=?]", patients_path, "post" do

      assert_select "input#patient_first_name[name=?]", "patient[first_name]"

      assert_select "input#patient_last_name[name=?]", "patient[last_name]"

      assert_select "input#patient_date_of_birth[name=?]", "patient[date_of_birth]"

      assert_select "input#patient_state[name=?]", "patient[state]"
    end
  end
end
