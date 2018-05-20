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
      it 'they should see a Log In button' do
        visit root_path

        expect(page).to have_button(@log_in)
        expect(page).to have_button(@sign_up)
      end
    end

    describe 'A logged in user visits the root page' do
      xit 'they should be redirected to the topics page' do
        visit root_path

        expect(page).to have_current_path(topics_path)
      end
    end
  end
end