class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  belongs_to :user

  validates :medication_id, :dosage, :schedule, :start, :end, presence: true
end
