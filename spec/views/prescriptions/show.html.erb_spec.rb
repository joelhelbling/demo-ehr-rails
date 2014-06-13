require 'rails_helper'

RSpec.describe "prescriptions/show", :type => :view do
  before(:each) do
    @prescription = assign(:prescription, Prescription.create!(
      :drug_number => "Drug Number",
      :quantity => 1,
      :frequency => "Frequency",
      :refills => 2,
      :dispense_as_written => false,
      :patient => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Drug Number/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Frequency/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
