require 'rails_helper'

RSpec.describe "prescriptions/index", :type => :view do
  before(:each) do
    assign(:prescriptions, [
      Prescription.create!(
        :drug_number => "Drug Number",
        :quantity => 1,
        :frequency => "Frequency",
        :refills => 2,
        :dispense_as_written => false,
        :patient => nil
      ),
      Prescription.create!(
        :drug_number => "Drug Number",
        :quantity => 1,
        :frequency => "Frequency",
        :refills => 2,
        :dispense_as_written => false,
        :patient => nil
      )
    ])
  end

  it "renders a list of prescriptions" do
    render
    assert_select "tr>td", :text => "Drug Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
