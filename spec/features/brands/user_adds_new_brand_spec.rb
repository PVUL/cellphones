require 'rails_helper'

feature 'salesperson records phone mfg', %{
  As a used phone salesperson
  I want to record a phone manufacturer
  So that I can keep track of the types of phones found in the store
} do

  # Acceptance Criteria:
  # [x] I must specify a phone manufacturer name and country
  # [x] If I do not specify the required information, I am presented with errors.
  # [x] If I specify the required information, the phone manufacturer is recorded and I am redirected to the index of phone manufacturers

  scenario 'user adds new phone mfg with required info' do
    visit new_brand_path

    fill_in 'Name', with: 'Apple'
    fill_in 'Country', with: 'China'

    click_button 'Submit'

    expect(page).to have_content('Successfully Added')
    expect(page).to have_content('Apple')
  end

  scenario 'user adds new phone mfg with missing info' do
    visit new_brand_path

    fill_in 'Name', with: 'Apple'
    fill_in 'Country', with: ''

    click_button 'Submit'

    expect(page).to have_content("Country can't be blank")
  end
end
