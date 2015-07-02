require 'rails_helper'

feature 'salesperson records used cell phones', %{
  As a used phone salesperson
  I want to record a newly acquired used cell phone
  So that I can list it in my store
} do

  # Acceptance Criteria:
  # [x] I must specify the cell phone manufacturer, year and battery life (an association between the phone and an existing manufacturer should be created).
  # [x] Only years from 2003 and above can be specified.
  # [x] I can optionally specify a description of the phone.
  # [x] If I enter all of the required information in the required formats, the phone is recorded and I am presented with a notification of success.
  # [x] If I do not specify all of the required information in the required formats, the phone is not recorded and I am presented with errors.
  # [x] Upon successfully creating a phone, I am redirected back to the index of phones.

  let!(:brand) { Brand.create(name:"Apple", country:"China") }

  scenario 'user adds new phone with required info' do
    visit new_phone_path
    select 'Apple', from: 'phone[brand_id]'
    fill_in 'Year', with: '2013'
    fill_in 'Battery', with: 'Good'

    click_button 'Submit'

    expect(page).to have_content('Successfully Added')
    expect(page).to have_content('Apple')
  end

  scenario 'user adds new phone with missing info' do
    visit new_phone_path
    select 'Apple', from: 'phone[brand_id]'
    fill_in 'Year', with: '2000'
    fill_in 'Battery', with: ''

    click_button 'Submit'

    expect(page).to have_content("Year must be greater than or equal to 2003")
    expect(page).to have_content("Battery can't be blank")
  end
end
