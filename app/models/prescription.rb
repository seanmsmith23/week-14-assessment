class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  belongs_to :user

  validates :medication_id, :dosage, :schedule, :start, :end, presence: true
  validate :dosage_has_number

  def dosage_has_number
    new = dosage.split

    if new[0].to_i == 0
      errors.add(:dosage, "must begin with a number")
    end
  end
end
