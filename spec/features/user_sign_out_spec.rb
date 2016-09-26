require 'spec_helper'

feature 'User sign out' do
  before(:each) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'when a user signs out' do
    sign_in(email: 'user@example.com',   password: 'secret1234')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye')
    expect(page).not_to have_content('Welcome, user@example.com')

  end
end
