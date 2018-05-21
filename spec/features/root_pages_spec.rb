require 'rails_helper'

# See 'spec/spec_helper.rb' for setup configurations (before :each)
RSpec.describe 'Root Page' do
  context '/' do
    describe 'Any type of visitor or user visits the root page' do
      it 'they should see the welcome message' do
        visit root_path

        expect(page).to have_content(@app_name.capitalize)
        expect(page).to have_content(@welcome_message)
      end
    end

    describe 'A user or visitor is not logged in and visits the root page' do
      it 'they should see a Log In button and a Sign Up' do
        visit root_path

        expect(page).to have_link(@log_in)
        expect(page).to have_link(@sign_up)
      end

      it 'clicking the Log In button should take them to the login page' do
        visit root_path

        click_link('Log In')

        expect(page).to have_current_path(login_path)
      end

      it 'clicking the Sign Up button should take them to the new user page' do
        visit root_path

        click_link('Sign Up')

        expect(page).to have_current_path(new_user_path)
      end
    end

    describe 'A logged in user visits the root page' do
      it 'they should be redirected to the topics page' do
        visit login_path

        fill_in 'email', with: @user1.email
        fill_in 'password', with: @user1.password
        click_button('Log In')

        visit root_path

        expect(page).to have_current_path(topics_path)
      end
    end
  end
end