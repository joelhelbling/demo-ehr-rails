require 'rails_helper'

describe RequestPagesController, type: :controller do
  let(:patient_attributes) { { first_name: 'Mark', last_name: 'Harris', date_of_birth: '10/11/1971', state: 'OH' } }
  let(:patient) { Patient.create! patient_attributes }
  let(:prescription_attributes) do
    { active:               true,
      drug_number:          '98033',
      drug_name:            'Nexium',
      quantity:             10,
      frequency:            'qD',
      refills:              3,
      dispense_as_written:  true,
      formulary_status:     'On Formulary',
      patient_id:           patient.id }
  end
  let(:prescription) { Prescription.create! prescription_attributes }
  let(:pa_request_attributes) do
    { prescription_id: prescription.id,
      form_id: '123',
      urgent: false,
      state: 'OH',
      sent: false,
      cmm_token: 'ABC123',
      cmm_link: 'http://api.cmm.com/PA-ID',
      cmm_id: 'PA-ID',
      cmm_workflow_status: 'New' }
  end
  let(:pa_request) { PaRequest.create! pa_request_attributes }

  describe 'GET show' do
    context 'format json' do
      let(:rp_json) { { 'some' => 'json' } }
      before { allow_any_instance_of(CmmApi::Client).to receive(:request_pages) { rp_json } }

      it 'retrieves the request-pages for the pa request' do
        expect_any_instance_of(CmmApi::Client).to receive(:request_pages).with( { id: pa_request.cmm_id, token_id: pa_request.cmm_token })
        get :show, { format: 'json', patient_id: patient.id, prescription_id: prescription.id, pa_request_id: pa_request.id }
      end
    end
  end

  describe 'POST create' do

  end
end
