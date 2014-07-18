class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @patient = Patient.find(params[:patient_id])
    @prescriptions = Prescription.where(:patient_id => params[:patient_id]).where(:active => true)
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
  end

  # GET /patient/:patient_id/prescriptions/new
  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.build
    @prescription.formulary_status = "Off formulary"
    @prescription.date_prescribed = Time.zone.now
    @prescription.active = true
  end

  # GET /patient/:patient_id/prescriptions/1/edit
  def edit
  end

  # POST /patient/:patient_id/prescriptions
  # POST /patient/:patient_id/prescriptions.json
  def create
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.build(prescription_params)
    @prescription.formulary_status = "Tier 3/PA"
    @prescription.date_prescribed = Time.zone.now
    @prescription.active = true

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @patient, notice: 'Prescription was successfully created.' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient/:patient_id/prescriptions/1
  # PATCH/PUT /patient/:patient_id/prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @patient, notice: 'Prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient/:patient_id/prescriptions/1
  # DELETE /patient/:patient_id/prescriptions/1.json
  def destroy
    #@prescription.destroy
    # we never delete prescriptions.  they just get archived
    @prescription.active = false
    @prescription.save
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Prescription was archived.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @patient = Patient.find(params[:patient_id])
      @prescription = Prescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:drug_number, :quantity, :frequency, :refills, :dispense_as_written, :patient_id, :drug_name, :formulary_status)
    end
end
