feature 'User sign up' do
  scenario 'requires a matching confirmation password' do
    sign_up
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'user cannot sign up with blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid email') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with previously registered email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
