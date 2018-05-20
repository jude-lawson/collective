require 'rails_helper'

RSpec.describe 'User Pages' do
  context '/users/new' do
    describe 'A non-registered user visits the new user page' do
      it 'they should be able to fill out a form to create their profile (not a teacher)' do
        visit new_users_path

        first_name = 'Bill'
        last_name = 'Potts'
        email = 'bpotts@everywhere.com'

        fill_in 'user[first_name]', with: first_name
        fill_in 'user[last_name]', with: last_name
        fill_in 'user[email]', with: email
        # Will not select teacher
        click_button 'Create User'

        expect(page).to have_current_path(user_path(User.last))
        expect(page).to have_content(first_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(email)
        expect(page).to have_content('Student')
      end

      it 'they should be able to fill out a form to create their profile (not a teacher)' do
        visit new_users_path

        first_name = 'Bill'
        last_name = 'Potts'
        email = 'bpotts@everywhere.com'

        fill_in 'user[first_name]', with: first_name
        fill_in 'user[last_name]', with: last_name
        fill_in 'user[email]', with: email
        # Will not select teacher
        click_button 'Create User'

        expect(page).to have_current_path(user_path(User.last))
        expect(page).to have_content(first_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(last_name)
        expect(page).to have_content(email)
        expect(page).to have_content('Student')
      end
    end
  end
end