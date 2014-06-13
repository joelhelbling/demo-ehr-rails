require File.expand_path '../spec_helper.rb', __FILE__

describe 'eHR Example App' do

  # Test all of the nav links
  describe 'navigating the site via nav bar' do
    fixtures :patients

    before(:each) do
      visit '/'
    end

    it 'should navigate to the patients view', :wip => true do
      click_link('e-Prescribing')
      page.should have_content('Patients')
    end

    it 'should navigate to the home view' do
      visit '/patients' # To test the home link visit another page besides the home page
      click_link('Home')
      page.should have_content('Lets pretend that this is your EHR...')
    end

    it 'should navigate to the dashboard view' do
      click_link('Prior Authorization')
      click_link('Task List')
      page.should have_content('Your Dashboard')
    end

    it 'should navigate to the new prior auth view' do
      click_link('Prior Authorization')
      click_link('New Prior Authorization')
      page.should have_content('First Name')
    end

    it 'should navigate to the contact cmm view' do
      click_link('Prior Authorization')
      click_link('Contact CoverMyMeds')
      page.should have_content('For assistance using CoverMyMeds')
    end

  end

  # Test everything a user can do on the patients index
  describe 'patients index workflow' do
    fixtures :patients

    before(:each) do
      visit '/patients'
    end

    it 'should allow accessing patients index directly', :wip => true do
      page.should have_content('Patients')
    end

    it 'clicking add patient should direct user to patients new view', :wip => true do
      click_link('Add patient')
      page.should have_content('First Name')
    end

    it 'should create ten default patients by default', :wip => true do
      page.should have_selector('.table')
      page.should have_css('.table tr.patients', count: 10)
    end

    it 'should navigate to new prescription form if patient is clicked with no prescriptions assigned' do
      within '.table tr.patients:nth-child(2)' do
        find('a', match: :first).click
      end
      page.should have_content('New Prescription')
    end

    it 'should delete a patient if remove button is clicked', :wip => true do
      within '.table' do
        click_link('X', match: :first)
      end
      page.should have_css('.table tr.patients', count: 9)
    end

  end

  describe 'patients add workflow' do
    fixtures :patients

    it 'should create a patient', :wip => true do
      visit '/patients/new'

      within 'fieldset' do
        fill_in('First Name', with: 'Example')
        fill_in('Last Name', with: 'Patient')
        fill_in('Date of Birth', with: '01/01/1970')
        find(:xpath, '//body').click # Use this to deactivate the datepicker
        select('Ohio', from: 'State')
        click_on('Create')
      end

      page.should have_content('Patient created successfully.')
    end

    it 'should add a drug to a patient' do
      visit '/patients'

      # Find the first patient and click on them
      within '.table tr.patients:nth-child(2)' do
        find('a', match: :first).click
      end

      # Find a drug
      find('#s2id_drug').click
      find('.select2-input').set('Nexium')
      page.should have_selector('.select2-result-selectable')
      within '.select2-results' do
        find('li:first-child').click
      end

      # Find a form
      # find('#s2id_form').click
      # find('.select2-input').set('bcbs')
      # page.should have_selector('.select2-result-selectable')
      # within '.select2-results' do
      #   find('li:first-child').click
      # end

      click_on('Save')

      # Back on the patient page
      page.should have_selector('#patient-show')

      check('request', match: :first)

      click_on('Next')

      # Should be on pharmacy list page
      page.should have_selector('#pharmacies-list')
      click_on('Finish')

      page.should have_content('Lets pretend that this is your EHR...')
    end

    it 'should navigate patient show if patient name is clicked and patient has prescription assigned', :wip => true do
      visit '/patients'

      within '.table tr.patients:nth-child(2)' do
        find('a', match: :first).click
      end
      
      page.should have_content("Prescriptions")

      # Find a drug
      find('#s2id_drug').click
      find('.select2-input').set('Nexium')
      page.should have_selector('.select2-result-selectable')
      within '.select2-results' do
        find('li:first-child').click
      end

      # Find a form
      # find('#s2id_form').click
      # find('.select2-input').set('bcbs')
      # page.should have_selector('.select2-result-selectable')
      # within '.select2-results' do
      #   find('li:first-child').click
      # end

      click_on('Save')

      visit '/patients'

      within '.table tr.patients:nth-child(2)' do
        find('a', match: :first).click
      end

      page.should have_content('Prescriptions')
    end

  end

  it 'should allow accessing the site root', :wip => true do
    visit('/')
    page.should have_content("Lets pretend that this is your EHR...")
  end

  it 'should display a help view', :wip => true do
    visit('/')
    find_link('Contact CoverMyMeds').click
    page.should have_content('For assistance using CoverMyMeds')
  end

end
