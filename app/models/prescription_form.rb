class PrescriptionForm
  def initialize(patient_id)
    @prescription = Prescription.new
    @patient = Patient.find(patient_id)
    @medications = Medication.all
  end

  def new_prescription
    @prescription
  end

  def medications
    @medications
  end

  def patient
    @patient
  end
end
