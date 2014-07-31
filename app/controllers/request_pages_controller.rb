class RequestPagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

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

        # save actions
        actions = @request_pages_json['request_page']['actions']
        @pa_request.update_attributes request_pages_actions: actions.to_json

        # replace actions in json (don't send tokens to browser)
        @request_pages_json['request_page']['actions'].each do |action|
          action['href'] = patient_prescription_pa_request_request_pages_path( action: action['title'] )
        end

      end
    end
  end

  def create
    respond_to do |format|
      @patient      = Patient.find params[:patient_id]
      @prescription = @patient.prescriptions.find params[:prescription_id]
      @pa_request   = @prescription.pa_requests.find params[:pa_request_id]

      api_id      = Rails.application.secrets.cmm_api_id
      api_version = Rails.application.secrets.cmm_api_version

      client = CmmApi::Client.new(api_id: api_id, version: api_version)

      rp_params = params.clone
      action_name = rp_params['form_action']
      action = JSON.parse(@pa_request.request_pages_actions).select do |action|
        action['title'] == action_name
      end.first

      [:patient_id, :prescription_id, :pa_request_id, :form_action, :controller, :action].each {|k| rp_params.delete k }
      if client.save_request_pages(action, rp_params)
        format.html { redirect_to @pa_request, notice: 'Request Pages successfully updated' }
      else
        format.html { render :show, notice: 'Unable to save changes!' }
      end
    end

  end
end
