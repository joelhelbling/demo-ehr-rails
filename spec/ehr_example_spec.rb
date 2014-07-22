require 'rails_helper'

describe 'eHR Example App' do
  fixtures :all

  # Test all of the nav links
  describe 'navigating the site via nav bar' do
    fixtures :patients, :prescriptions

    before(:each) do
      visit '/'
    end

    it 'should navigate to the patients view', js:true do
      click_link('Patients')
      expect(page).to have_content('Patients')
      expect(page).to have_content('Patients')
    end

    it 'should navigate to the home view', js:true do
      visit '/patients' # To test the home link visit another page besides the home page
      click_link('Home')
      expect(page).to have_content('Lets pretend that this is your EHR...')
    end

    it 'should navigate to the dashboard view' do
      click_link('Prior Authorization')
      expect(page).to have_content('Your Prior Auth Dashboard')
    end

    it 'should navigate to the new prior auth view', js: true do
      click_link('Patients')
      expect(page).to have_content('Patients')

      # Amber has a prescription
      click_link('Amber Smith (10/01/1971)')

      expect(page).to have_content('Prescriptions')

      find('#start_pa_request', match: :first).click
      expect(page).to have_content('New PA Request')
    end

    it 'should navigate to the contact cmm view' do
      click_link('Resources')
      click_link('Contact CoverMyMeds')
      expect(page).to have_content('For assistance using CoverMyMeds')
    end

    it 'should navigate to the api documentation' do
      click_link('Resources')
      click_link('API Documentation')
      expect(page).to have_title('API Reference')
    end
  end

  # Test everything a user can do on the patients index
  describe 'patients index workflow' do
    fixtures :patients, :prescriptions

    before(:each) do
      visit '/patients'
    end

    it 'should allow accessing patients index directly', :wip => true do
      expect(page).to have_content('Patients')
    end

    it 'clicking add patient should direct user to patients new view', :wip => true do
      click_link('Add patient')
      expect(page).to have_content('First Name')
    end

    it 'should create ten default patients by default', :wip => true do
      expect(page).to have_selector('.table')
      expect(page).to have_css('.table tr.patients', count: 10)
    end

    it 'should navigate to new prescription form if patient is clicked with no prescriptions assigned', :failed => true do
      click_link('Mike Miller (10/01/1971)')
      expect(page).to have_content('Prescription -')
    end

    it 'should delete a patient if remove button is clicked', :wip => true do

      within '.table' do
        click_link('X', match: :first)
      end
      expect(page).to have_css('.table tr.patients', count: 9)
    end

  end

  describe 'patients add workflow' do
    fixtures :patients, :prescriptions

    it 'should create a patient', :wip => true do
      visit '/patients/new'

      within 'fieldset' do
        fill_in('patient_first_name', with: 'Example')
        fill_in('patient_last_name', with: 'Patient')
        fill_in('Birthdate', with: '01/01/1970')
        find(:xpath, '//body').click # Use this to deactivate the datepicker
        select('Ohio', from: 'State')
        click_on('Create')
      end

      expect(page).to have_content('Patient created successfully.')
    end

    it 'should add a medication to a patient', js: true do
      visit '/patients'

      # Find the first patient and click on them
      click_link('Amber Smith (10/01/1971')
        click_link('Add Prescription')

      # Find a medication
      find('#s2id_prescription_drug_number').click
      find('.select2-input').set('Nexium')
      expect(page).to have_selector('.select2-result-selectable')
      within '.select2-results' do
        find('li:first-child').click
      end

      click_on('Save')

      # Back on the patient page
      expect(page).to have_selector('#patient-show')

      # start the prior auth
#      click_on('Start')

      # check('request', match: :first)

      # click_on('Next')

      # # Should be on pharmacy list page
      # expect(page).to have_selector('#pharmacies-list')
      # click_on('Finish')

      # expect(page).to have_content('Lets pretend that this is your EHR...')
    end

    it 'should navigate patient show if patient name is clicked and patient has prescription assigned', :wip => true, js: true do
      visit '/'
      click_link('Patients')
      click_link("Amber Smith (10/01/1971)")

      click_link('Add Prescription')

      # Find a drug
      find('#s2id_prescription_drug_number').click
      find('.select2-input').set('Nexium')
      expect(page).to have_selector('.select2-result-selectable')
      within '.select2-results' do
        find('li:first-child').click
      end

      click_on('Save')

      visit '/patients'
      click_link("Amber Smith (10/01/1971)")
      expect(page).to have_content('Add Prescription')
    end

  end

  it 'should allow accessing the site root', :wip => true do
    visit('/')
    expect(page).to have_content("Lets pretend that this is your EHR...")
  end

  it 'should display a help view', :wip => true do
    visit('/')
    click_link('Resources')
    click_link('Contact CoverMyMeds')
    expect(page).to have_content('For assistance using CoverMyMeds')
  end

end

