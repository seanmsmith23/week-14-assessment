class Prescription < ActiveRecord::Base
  belongs_to :patient

  validates :medication, :dosage, :schedule, :start, :end, presence: true
end
