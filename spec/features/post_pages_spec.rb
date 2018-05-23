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


  context '/topics/:id/posts/:id/edit' do
    describe 'A teacher tries to edit a post' do
      it 'they should be able to edit the post' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_topic_post_path(@topic1, @post3)

        edited_title = 'Edited Title'
        edited_body = 'Edited body of post'

        fill_in :post_title, with: edited_title
        fill_in :post_body, with: edited_body
        click_button 'Update Post'

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to have_content(edited_title)
        expect(page).to have_content(edited_body)

        expect(page).to_not have_content(@post3.title)
        expect(page).to_not have_content(@post3.body)
      end
    end

    describe 'A student tries to edit a post' do
      it 'they should be able to edit the post' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_topic_post_path(@topic1, @post3)

        edited_title = 'Edited Title'
        edited_body = 'Edited body of post'

        fill_in :post_title, with: edited_title
        fill_in :post_body, with: edited_body
        click_button 'Update Post'

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to have_content(edited_title)
        expect(page).to have_content(edited_body)

        expect(page).to_not have_content(@post3.title)
        expect(page).to_not have_content(@post3.body)
      end
    end

    describe 'A visitor tries to edit a post' do
      it 'they should see a 404 page' do
        visit edit_topic_post_path(@topic1, @post3)

        expect(page).to have_content('The page you were looking for doesn\'t exist')
      end
    end 
  end
end
