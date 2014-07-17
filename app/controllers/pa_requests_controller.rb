class PaRequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
  	@requests = PaRequest.all
  end

  # GET /patients/1/prescriptions/1/pa_requests/1
  # GET /patients/1/prescriptions/1/pa_requests/1.json
  def show
    if @pa_request.cmm_link
      respond_to do |format|
        format.html { redirect_to @pa_request.cmm_link+"?token_id=#{@pa_request.cmm_token}" }
        format.json { render :show, status: :ok, location: @pa_request}
      end
    end
  end

  # GET /patients/1/prescriptions/1/pa_requests/new
  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.find(params[:prescription_id])
    @request = @prescription.pa_requests.build
  end

  # GET /patients/1/prescriptions/1/pa_requests/1/edit
  def edit
    @patient      = Patient.find params[:patient_id]
    @prescription = @patient.prescriptions.find params[:prescription_id]
    @request   = @prescription.pa_requests.find params[:id]
  end

  # POST /patients/1/prescriptions/1/pa_requests
  # POST /patients/1/prescriptions/1/pa_requests.json
  def create
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.find(params[:prescription_id])
    @pa_request = @prescription.pa_requests.build(pa_request_params)

    respond_to do |format|
      if @pa_request.save
        format.html { redirect_to @patient, notice: 'PaRequest was successfully started.' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @patient = Patient.find(params[:patient_id])
      @prescription = @patient.prescriptions.find(params[:prescription_id])
      @pa_request = @prescription.pa_requests.find(params[:id])
      logger.debug "#{@request}"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pa_request_params
      params.require(:pa_request).permit(:prescription_id, :form_id, :urgent, :state, :sent, :cmm_token, :cmm_link, :cmm_id, :cmm_workflow_status)
    end

end
