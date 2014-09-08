class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    @patient = Patient.find(params[:patient_id])
    @medications = Medication.all
  end

  def create
    start = Date.strptime(params[:prescription][:start], "%m/%d/%Y")
    finish = Date.strptime(params[:prescription][:end], "%m/%d/%Y")

    @prescription = Prescription.create(
      medication: params[:prescription][:medication],
      schedule: params[:prescription][:schedule],
      dosage: params[:prescription][:dosage],
      start: start,
      end: finish,
      patient_id: params[:patient_id]
    )

    if @prescription.save
      redirect_to patient_path(params[:patient_id]), alert: "Your prescription has been created"
    end
  end
end
