class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
  	@requests = Request.all
  	@token_ids_array = ['gq9vmqai2mkwewv1y55x', '33lhqakhtmas8r965w39', 's4c85zi3ku0b9re5sg1o']
  end

  # GET /patients/1/prescriptions/1/requests/1
  # GET /patients/1/prescriptions/1/requests/1.json
  def show
  end

  # GET /patients/1/prescriptions/1/requests/new
  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.find(params[:prescription_id])
    @request = @prescription.requests.build
  end

  # GET /patients/1/prescriptions/1/requests/1/edit
  def edit
  end

  # POST /patients/1/prescriptions/1/requests
  # POST /patients/1/prescriptions/1/requests.json
  def create
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.find(params[:prescription_id])
    @request = @prescription.requests.build(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @patient, notice: 'Request was successfully started.' }
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
      @request = @prescription.requests.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:drug_number, :quantity, :frequency, :refills, :dispense_as_written, :patient_id, :drug_name, :formulary_status)
    end

end
