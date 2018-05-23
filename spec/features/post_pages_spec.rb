require 'rails_helper'

RSpec.describe 'Post Pages' do
  context 'topics/:id/posts/new' do
    describe 'A teacher visits the new post page' do
      it 'they should be able to create a new post' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_topic_post_path(@topic1)

        post_title = 'Let\'s talk about the TARDIS'
        post_body = 'It\'s literally the best ship in the universe. There\'s not much more to say about that.'

        fill_in :post_title, with: post_title
        fill_in :post_body, with: post_body
        click_button 'Create Post'

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to have_content(post_title)
        expect(page).to have_content(post_body)
      end
    end

    describe 'A student visits the new post page' do
      it 'they should be able to create a new post' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_topic_post_path(@topic1)

        post_title = 'Let\'s talk about the TARDIS'
        post_body = 'It\'s literally the best ship in the universe. There\'s not much more to say about that.'

        fill_in :post_title, with: post_title
        fill_in :post_body, with: post_body
        click_button 'Create Post'

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to have_content(post_title)
        expect(page).to have_content(post_body)
      end
    end

    describe 'A visitor visits the new post page' do
      it 'they should see a 404 page' do
        visit new_topic_post_path(@topic1)

        expect(page).to have_content('The page you were looking for doesn\'t exist')
      end
    end
  end
end
