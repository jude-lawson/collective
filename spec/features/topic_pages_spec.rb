require 'rails_helper'

RSpec.describe 'Topic Pages' do
  context '/topics' do
    describe 'A logged in user visits the topics page' do
      it 'they should see all of the topics' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit topics_path

        expect(page).to have_link(@topic1.title)
      end
    end
  end

  context '/topics/new' do
    describe 'A teacher visits the new topic page' do
      it 'they should be able to create a topic' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit new_teacher_topic_path

        new_topic_title = 'A Brand New Topic'

        fill_in :topic_title, with: new_topic_title
        click_button 'Create Topic'

        expect(page).to have_current_path(topic_path(Topic.last))
        expect(page).to have_content(new_topic_title)
      end
    end

    describe 'A student visits the new topic page' do
      it 'they should see a 404 page' do
      end
    end

    describe 'A visitor visits the new topic page' do
      it 'they should see a 404 page' do
      end
    end
  end
end
