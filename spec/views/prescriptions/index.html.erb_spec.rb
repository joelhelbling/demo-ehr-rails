require 'rails_helper'

RSpec.describe "prescriptions/index", :type => :view do
  before(:each) do
    assign(:patient, Patient.create!(
      :first_name => 'Mark',
      :last_name => 'Harris',
      :date_of_birth => '10/11/1971',
      :state => 'OH'
    ))
    assign(:prescriptions, [
      Prescription.create!(
        :drug_number => "12345",
        :drug_name => 'Drug Name',
        :quantity => 1,
        :frequency => "qD",
        :refills => 2,
        :dispense_as_written => false,
        :patient => @patient
      ),
      Prescription.create!(
        :drug_number => "12345",
        :drug_name => 'Drug Name',
        :quantity => 1,
        :frequency => "qD",
        :refills => 2,
        :dispense_as_written => false,
        :patient => @patient
      )
    ])
  end

  it "renders a list of prescriptions" do
    render
    assert_select "tr>td", :text => "Drug Name", :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "qD", :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end

  it "renders the patient's name" do
    render
    assert_select "h1", :text => "Prescriptions for Mark Harris (10/11/1971)", :count => 1
  end

end
