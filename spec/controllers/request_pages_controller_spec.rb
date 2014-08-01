require 'rails_helper'

describe RequestPagesController, type: :controller do
  let(:patient_attributes) do
    {
      first_name:     'Mark',
      last_name:      'Harris',
      date_of_birth:  '10/11/1971',
      state:          'OH'
    }
  end
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
      let(:action_url) { 'http://api.cmm.com?token_id=etc' }
      let(:rp_json) do
        JSON.parse( {
          request_page: {
            actions: [
              {
                href:    action_url,
                ref:     'pa_request',
                method:  'PUT',
                title:   'Save'
              }
            ]
          }
        }.to_json )
      end
      let(:client_params) do
        {
          id:        pa_request.cmm_id,
          token_id:  pa_request.cmm_token
        }
      end
      let(:show_params) do
        {
          format:           'json',
          patient_id:       patient.id,
          prescription_id:  prescription.id,
          pa_request_id:    pa_request.id
        }
      end

      before do
        allow_any_instance_of(CmmApi::Client).to receive(:request_pages) do
          rp_json
        end
      end

      it 'retrieves the request-pages for the pa request' do
        expect_any_instance_of(CmmApi::Client).to receive(:request_pages).with( client_params )
        get :show, show_params
      end

      it 'stores the actions in the pa_request' do
        get :show, show_params
        pa_request.reload
        expect(pa_request.request_pages_actions).to include(action_url)
      end

      it 'hides the actions from the browser' do
        get :show, show_params
        expect(subject.instance_variable_get(:@request_pages_json)).to_not include(action_url)
      end
    end
  end

  describe 'POST request_pages' do
    context 'format json' do
      let(:cmm_action_url) { 'http://api.cmm.com?token_id=etc' }
      let(:cmm_action) do
        JSON.parse({
          href:    cmm_action_url,
          ref:     'pa_request',
          method:  'PUT',
          title:   'Save'
        }.to_json)
      end
      let(:cmm_actions) { [ cmm_action ] }
      let(:params) do
        {
          patient_id:       patient.id,
          prescription_id:  prescription.id,
          pa_request_id:    pa_request.id,
          form_action:      'Save',
          some:             'application/x-www-form-urlencoded form data'
        }
      end
      let(:rp_params) do
        {
          some:             'application/x-www-form-urlencoded form data'
        }
      end

      let(:action_url) { 'http://api.cmm.com?token_id=etc' }
      let(:rp_json) do
        JSON.parse( {
          request_page: {
            actions: [
              {
                href:    action_url,
                ref:     'pa_request',
                method:  'PUT',
                title:   'Save'
              }
            ]
          }
        }.to_json )
      end

      before do
        pa_request.update_attributes request_pages_actions: cmm_actions.to_json
        allow_any_instance_of(CmmApi::Client).to receive(:request_pages) do
          rp_json
        end
      end

      it 'sends the request json to the CMM API' do
        expect_any_instance_of(CmmApi::Client).to receive(:send_request_pages).with( cmm_action, rp_params ) { rp_json }
        post :create, params.merge( format: :json )
      end

    end
  end
end
