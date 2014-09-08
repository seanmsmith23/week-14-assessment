class PrescriptionsController < ApplicationController
  def new
    @prescription_form = PrescriptionForm.new(params[:patient_id])
  end

  def create
    if params[:prescription][:start] != "" && params[:prescription][:end] != ""
      start = Date.strptime(params[:prescription][:start], "%m/%d/%Y")
      finish = Date.strptime(params[:prescription][:finish], "%m/%d/%Y")
    end

    @prescription = Prescription.create(
      medication_id: params[:prescription][:medication_id],
      schedule: params[:prescription][:schedule],
      dosage: params[:prescription][:dosage],
      start: start,
      finish: finish,
      patient_id: params[:patient_id],
      user_id: current_user.id
    )

    if @prescription.save
      redirect_to patient_path(params[:patient_id]), alert: "Your prescription has been created"
    else
      @prescription
      @prescription_form = PrescriptionForm.new(params[:patient_id])
      render 'new'
    end
  end
end
