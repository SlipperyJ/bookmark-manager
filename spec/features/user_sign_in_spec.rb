require 'spec_helper'

feature 'User sign in' do
  before(:each) do
    sign_up
  end

  scenario 'can sign in a user' do
    visit '/users/sign_in'
    fill_in 'email', with: 'albie@albie.com'
    fill_in 'password', with: 'joe1'
    click_button 'Sign In'
    expect(page).to have_content('Welcome, albie@albie.com')
  end
end
