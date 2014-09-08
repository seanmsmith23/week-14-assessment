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

  scenario "User can add a patient prescription from the patient page" do
    user = create_user
    patient = create_patient
    medication = create_medication
    login(user)
    click_link "#{patient.first_name} #{patient.last_name}"

    click_link "Add Prescription"

    select "Tylenol", from: "prescription[medication]"
    fill_in "prescription[dosage]", with: "5 mgs"
    fill_in "prescription[schedule]", with: "2 days"
    fill_in "prescription[start]", with: "09/26/2014"
    fill_in "prescription[end]", with: "09/27/2014"

    click_button "Create Prescription"

    expect(page).to have_content ("Your prescription has been created")
    expect(page).to have_content ("Tylenol")
    expect(page).to have_content ("5 mgs every 2 days")
    expect(page).to have_content ("2014-09-26 - 2014-09-27")

  end

end