
require 'rails_helper'

RSpec.describe 'Employee authentication actions' do
  let(:employee) {build(:employee)}

  it 'Setup employee account' do
    visit root_path
    
    click_link 'Sign_up'
    fill_in 'Email', with: employee_email
    fill_in "Password", with:employee_password
    fill_in "Password confirmation", with: employee.password
    click_button 'Sign_up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'

    click_on 'Log out'
    expect(page).to have_account 'You need to sign in or sign up before continuing.'

    click_link 'Log in'
    fill_in 'Email', with: employee_email
    fill_in "Password", with:employee_password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end
end