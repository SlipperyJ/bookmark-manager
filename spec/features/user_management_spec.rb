feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    sign_up
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'user cannot sign up with blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid email') }.not_to change(User, :count)
  end
end
