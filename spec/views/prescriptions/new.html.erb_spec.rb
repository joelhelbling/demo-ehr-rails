require 'rails_helper'

RSpec.describe "prescriptions/new", :type => :view do
  before(:each) do
    assign(:prescription, Prescription.new(
      :drug_number => "MyString",
      :quantity => 1,
      :frequency => "MyString",
      :refills => 1,
      :dispense_as_written => false,
      :patient => nil
    ))
  end

  it "renders new prescription form" do
    render

    assert_select "form[action=?][method=?]", prescriptions_path, "post" do

      assert_select "input#prescription_drug_number[name=?]", "prescription[drug_number]"

      assert_select "input#prescription_quantity[name=?]", "prescription[quantity]"

      assert_select "input#prescription_frequency[name=?]", "prescription[frequency]"

      assert_select "input#prescription_refills[name=?]", "prescription[refills]"

      assert_select "input#prescription_dispense_as_written[name=?]", "prescription[dispense_as_written]"

      assert_select "input#prescription_patient_id[name=?]", "prescription[patient_id]"
    end
  end
end
