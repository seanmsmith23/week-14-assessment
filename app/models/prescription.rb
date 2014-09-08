class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates :medication_id, :dosage, :schedule, :start, :end, presence: true
end
