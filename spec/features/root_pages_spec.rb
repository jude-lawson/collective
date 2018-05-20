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
  end
end