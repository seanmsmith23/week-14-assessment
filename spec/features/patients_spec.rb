require 'rails_helper'
require 'capybara/rails'

feature "Patients" do

  scenario "User sees all patients" do
    user = create_user
    patient = create_patient
    login(user)

    expect(page).to have_link("#{patient.first_name} #{patient.last_name}")

  end

  scenario "When user clicks on a patient name they see the patient page and an empty table with prescriptions" do
    user = create_user
    patient = create_patient
    login(user)

    click_link "#{patient.first_name} #{patient.last_name}"

    expect(page).to have_content("Prescriptions")
  end

end