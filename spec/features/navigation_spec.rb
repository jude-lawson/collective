require 'rails_helper'

RSpec.describe 'Navigation' do
  context '/' do
    describe 'A visitor visits the root page' do
      it 'should have a topics, sign up, and log in link' do
        visit root_path

        expect(page).to have_link('Topics')
        expect(page).to have_link('Sign Up')
        expect(page).to have_link('Log In')
      end

      it 'the topics link should take you to the page for all topics' do
        visit root_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end
    end

    describe 'A teacher in user visits the root page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit root_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit root_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit root_path

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the root page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit root_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the root page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit root_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit root_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit root_path

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the root page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit root_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context '/users' do
    describe 'A teacher in user visits the users page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit users_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit users_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit users_path

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the users page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit users_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the users page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit users_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit users_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit users_path

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the users page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit users_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end

  context '/users/:id' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit user_path(@user1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit user_path(@user1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit user_path(@user1)

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit user_path(@user1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit user_path(@user2)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit user_path(@user2)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit user_path(@user2)

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit user_path(@user2)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context '/users/new' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_user_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_user_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_user_path

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit new_user_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_user_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_user_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_user_path

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit new_user_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  # xcontext '/users/:id/edit' do
  #   describe 'A teacher in user visits the user page' do
  #     it 'should have a topic link, and a link to the user\'s profile' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  #       visit edit_user_path(@user1)

  #       expect(page).to have_link('Topics')
  #       expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
  #       expect(page).to have_button('Log Out')
  #     end

  #     it 'the Topics link should take the user to the topics page' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  #       visit edit_user_path(@user1)

  #       click_link 'Topics'

  #       expect(page).to have_current_path(topics_path)
  #       expect(page).to have_link(@topic1.title)
  #     end

  #     it 'the user\'s name should take them to their profile' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  #       visit edit_user_path(@user1)

  #       click_link "#{@user1.first_name} #{@user1.last_name}"

  #       expect(page).to have_current_path(user_path(@user1))
  #       expect(page).to have_content(@user1.first_name)
  #       expect(page).to have_content(@user1.last_name)
  #       expect(page).to have_content(@user1.email)
  #     end

  #     it 'Log Out should log the user out and take them to the user page' do
  #       # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  #       # can't use stubs for testing logout
  #       log_the_doctor_in
  #       visit edit_user_path(@user1)

  #       click_button 'Log Out'

  #       expect(page).to have_current_path(root_path)
  #       expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
  #     end
  #   end

  #   describe 'A student in user visits the user page' do
  #     it 'should have a topic link, and a link to the user\'s profile' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
  #       visit edit_user_path(@user2)

  #       expect(page).to have_link('Topics')
  #       expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
  #       expect(page).to have_button('Log Out')
  #     end

  #     it 'the Topics link should take the user to the topics page' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
  #       visit edit_user_path(@user2)

  #       click_link 'Topics'

  #       expect(page).to have_current_path(topics_path)
  #       expect(page).to have_link(@topic1.title)
  #     end

  #     it 'the user\'s name should take them to their profile' do
  #       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
  #       visit edit_user_path(@user2)

  #       click_link "#{@user2.first_name} #{@user2.last_name}"

  #       expect(page).to have_current_path(user_path(@user2))
  #       expect(page).to have_content(@user2.first_name)
  #       expect(page).to have_content(@user2.last_name)
  #       expect(page).to have_content(@user2.email)
  #     end

  #     it 'Log Out should log the user out and take them to the user page' do
  #       # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  #       # can't use stubs for testing logout
  #       log_the_rory_in
  #       visit edit_user_path(@user2)

  #       click_button 'Log Out'

  #       expect(page).to have_current_path(root_path)
  #       expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
  #     end
  #   end
  # end
  context '/topics' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topics_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topics_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topics_path

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit topics_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topics_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topics_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topics_path

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit topics_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context '/topics/:id' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topic_path(@topic1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topic_path(@topic1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit topic_path(@topic1)

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit topic_path(@topic1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topic_path(@topic1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topic_path(@topic1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit topic_path(@topic1)

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit topic_path(@topic1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context 'topics/new' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_teacher_topic_path

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_teacher_topic_path

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_teacher_topic_path

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit new_teacher_topic_path

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context 'topics/:id/edit' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_teacher_topic_path(@topic1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_teacher_topic_path(@topic1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_teacher_topic_path(@topic1)

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit edit_teacher_topic_path(@topic1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context 'topics/:id/post/new' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_topic_post_path(@topic1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_topic_post_path(@topic1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit new_topic_post_path(@topic1)

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit new_topic_post_path(@topic1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_topic_post_path(@topic1)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_topic_post_path(@topic1)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit new_topic_post_path(@topic1)

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit new_topic_post_path(@topic1)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
  context 'topics/:id/posts/:id/edit' do
    describe 'A teacher in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_topic_post_path(@topic1, @post3)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user1.first_name} #{@user1.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_topic_post_path(@topic1, @post3)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        visit edit_topic_post_path(@topic1, @post3)

        click_link "#{@user1.first_name} #{@user1.last_name}"

        expect(page).to have_current_path(user_path(@user1))
        expect(page).to have_content(@user1.first_name)
        expect(page).to have_content(@user1.last_name)
        expect(page).to have_content(@user1.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_doctor_in
        visit edit_topic_post_path(@topic1, @post3)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end

    describe 'A student in user visits the user page' do
      it 'should have a topic link, and a link to the user\'s profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit edit_topic_post_path(@topic1, @post2)

        expect(page).to have_link('Topics')
        expect(page).to have_link("#{@user2.first_name} #{@user2.last_name}")
        expect(page).to have_button('Log Out')
      end

      it 'the Topics link should take the user to the topics page' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit edit_topic_post_path(@topic1, @post2)

        click_link 'Topics'

        expect(page).to have_current_path(topics_path)
        expect(page).to have_link(@topic1.title)
      end

      it 'the user\'s name should take them to their profile' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
        visit edit_topic_post_path(@topic1, @post2)

        click_link "#{@user2.first_name} #{@user2.last_name}"

        expect(page).to have_current_path(user_path(@user2))
        expect(page).to have_content(@user2.first_name)
        expect(page).to have_content(@user2.last_name)
        expect(page).to have_content(@user2.email)
      end

      it 'Log Out should log the user out and take them to the user page' do
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
        # can't use stubs for testing logout
        log_the_rory_in
        visit edit_topic_post_path(@topic1, @post2)

        click_button 'Log Out'

        expect(page).to have_current_path(root_path)
        expect(page).to_not have_link("#{@user1.first_name} #{@user1.last_name}")
      end
    end
  end
end
