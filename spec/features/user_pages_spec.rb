require 'rails_helper'

RSpec.describe 'User Pages' do
  context '/users/new' do
    describe 'A non-registered user visits the new user page' do
      it 'they should be able to fill out a form to create their profile (not a teacher)' do
        visit new_user_path

        first_name = 'Bill'
        last_name = 'Potts'
        email = 'bpotts@everywhere.com'
        password = 'He@ther'
        
        fill_in 'user[first_name]', with: first_name
        fill_in 'user[last_name]', with: last_name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        # Will not select teacher
        click_button 'Create User'

        expect(page).to have_current_path(user_path(User.last))
        expect(page).to have_content(first_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(email)
        expect(page).to have_content('Student')
      end

      it 'they should be able to fill out a form to create their profile (is a teacher)' do
        visit new_user_path

        first_name = 'River'
        last_name = 'Song'
        email = 'rsong@stormcage.com'
        password = 'MelodyPond'

        fill_in 'user[first_name]', with: first_name
        fill_in 'user[last_name]', with: last_name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        check('I\'m a teacher!')
        click_button 'Create User'

        expect(page).to have_current_path(user_path(User.last))
        expect(page).to have_content(first_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(email)
        expect(page).to have_content('Teacher')
      end

      it 'they should not be able to create an account with the same email address' do
        visit new_user_path

        fill_in 'user[first_name]', with: @user1.first_name
        fill_in 'user[last_name]', with: @user1.last_name
        fill_in 'user[email]', with: @user1.email
        fill_in 'user[password]', with: @user1.password
        check('I\'m a teacher!')
        click_button 'Create User'

        # Expecting to be redirected to POST path, but render form
        expect(page).to have_current_path(users_path)
        expect(page).to have_content('First name')
        expect(page).to have_content('Last name')
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
      end
    end
  end

  context '/users' do
    describe 'A logged in user visits the page for all users' do
      it 'they should see a list of all registered users' do
        # log_the_doctor_in
        visit login_path

        fill_in :email, with: @user1.email
        fill_in :password, with: @user1.password
        click_button 'Log In'
        # At topics path here

        # save_and_open_page
        visit users_path
        expect(page).to have_current_path(users_path)
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user3.first_name)
        expect(page).to have_content(@user3.last_name)
      end
    end

    describe 'A non-logged in user or visitor visits the users page' do
      it 'they should be redirected to the root page where they can log in or sign up' do
        visit users_path

        expect(page).to have_current_path(root_path)
        expect(page).to have_link(@log_in)
        expect(page).to have_link(@sign_up)
      end
    end
  end

  context '/users/:id' do
    describe 'A user visits their profile page' do
      it 'they should see their profile information' do
        visit user_path(@user1)

        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
        expect(page).to have_content('Teacher')
      end
    end
  end
end
