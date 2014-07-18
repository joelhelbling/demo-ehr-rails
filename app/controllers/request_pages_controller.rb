class RequestPagesController < ApplicationController

  def show
    respond_to do |format|
      @patient = Patient.find params[:patient_id]
      @prescription = @patient.prescriptions.find params[:prescription_id]
      @pa_request = @prescription.pa_requests.find params[:pa_request_id]

      format.html
      format.json do
        api_id      = Rails.application.secrets.cmm_api_id
        api_version = Rails.application.secrets.cmm_api_version

        client = CmmApi::Client.new(api_id: api_id, version: api_version)
        @request_pages_json = client.request_pages(id: @pa_request.cmm_id, token_id: @pa_request.cmm_token)
      end
    end
  end
end
