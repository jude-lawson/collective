require 'rails_helper'

RSpec.describe 'Topic Pages' do
  context '/topics' do
    describe 'A logged in user visits the topics page' do
      it 'they should see all of the topics' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit topics_path

        expect(page).to have_link(@topic1.title)
        within('#topic-' + @topic1.id.to_s) do
          expect(page).to have_link('Edit')
        end

        expect(page).to have_link(@topic2.title)
        within('#topic-' + @topic2.id.to_s) do
          expect(page).to_not have_link('Edit')
        end
      end
    end

    describe 'A visitor visits the topics page' do
      it 'they should see all of the topics' do
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
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_teacher_topic_path

        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end

    describe 'A visitor visits the new topic page' do
      it 'they should see a 404 page' do
        visit new_teacher_topic_path

        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end

  context '/topics/:id/edit' do
    describe 'A teacher visits the topic edit page' do
      it 'they can edit the topic' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit edit_teacher_topic_path(@topic1)

        edited_title = 'An Edited Title'

        fill_in :topic_title, with: edited_title
        click_button 'Update Topic'

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to have_content(edited_title)
      end
    end

    describe 'A teacher tries to edit another teacher\'s topic' do
      it 'they should seea 404 page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit edit_teacher_topic_path(@topic2)

        expect(page).to have_content('The page you were looking for doesn\'t exist')
      end
    end

    describe 'A student tries to edit a topic' do
      it 'they should seea 404 page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

        visit edit_teacher_topic_path(@topic2)

        expect(page).to have_content('The page you were looking for doesn\'t exist')
      end
    end

    describe 'A visitor tries to edit a topic' do
      it 'they should seea 404 page' do
        visit edit_teacher_topic_path(@topic2)

        expect(page).to have_content('The page you were looking for doesn\'t exist')
      end
    end
  end

  context '/topics/:id' do
    describe 'A logged in teacher visits a topic page' do
      it 'they should see all of the posts for that topic' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topic_path(@topic1)

        expect(page).to have_content(@post1.title)
        expect(page).to have_content(@post1.body)

        expect(page).to have_content(@post2.title)
        expect(page).to have_content(@post2.body)
      end

      it 'a user should only have links to edit their posts' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topic_path(@topic1)

        within('#post-' + @post2.id.to_s) do
          expect(page).to have_link('Edit')
        end

        within('#post-' + @post1.id.to_s) do
          expect(page).to_not have_link('Edit')
        end
      end

      it 'they should only see delete links for their posts and be able to delete their posts' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit topic_path(@topic1)

        within('#post-' + @post2.id.to_s) do
          expect(page).to_not have_link('Delete')
        end

        within('#post-' + @post3.id.to_s) do
          expect(page).to have_link('Delete')
          click_link 'Delete'
        end

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to_not have_content(@post3.title)
        expect(page).to_not have_content(@post3.body)
      end
    end

    describe 'A logged in student visits a topic page' do
      it 'they should see all of the posts for that topic' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topic_path(@topic1)

        expect(page).to have_content(@post1.title)
        expect(page).to have_content(@post1.body)
        expect(page).to have_content(@post2.title)
        expect(page).to have_content(@post2.body)
      end

      it 'they should only see delete links for their posts and be able to delete their posts' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

        visit topic_path(@topic1)

        within('#post-' + @post1.id.to_s) do
          expect(page).to_not have_link('Delete')
        end

        within('#post-' + @post2.id.to_s) do
          expect(page).to have_link('Delete')
          click_link 'Delete'
        end

        expect(page).to have_current_path(topic_path(@topic1))
        expect(page).to_not have_content(@post2.title)
        expect(page).to_not have_content(@post2.body)
      end
    end

    describe 'A visitor visits a topic page' do
      it 'they should see all of the posts for that topic' do
        visit topic_path(@topic1)

        expect(page).to have_content(@post1.title)
        expect(page).to have_content(@post1.body)
        expect(page).to have_content(@post2.title)
        expect(page).to have_content(@post2.body)
      end
    end
  end
end
