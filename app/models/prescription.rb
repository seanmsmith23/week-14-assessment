class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  belongs_to :user

  validates :medication_id, :dosage, :schedule, :start, :finish, presence: true
  validate :dosage_has_number
  validate :first_before_last

  def dosage_has_number
    new = dosage.split

    if new[0].to_i == 0
      errors.add(:dosage, "must begin with a number")
    end
  end

  def first_before_last
    if finish != nil && start != nil
      if finish < start
        errors.add(:end, "date must be after the start date")
      end
    end
  end
end
