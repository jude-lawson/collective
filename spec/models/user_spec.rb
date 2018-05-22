require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Relationships' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:topic_contributions) }
    it { should have_many(:topics) }
  end

  describe 'Roles' do
    it 'should be able to be an admin' do
      expect(@user1.role).to eq('teacher')
      expect(@user1.teacher?).to be_truthy
      expect(@user1.student?).to be_falsy
    end

    it 'should be able to be a student' do
      expect(@user2.role).to eq('student')
      expect(@user2.teacher?).to be_falsy
      expect(@user2.student?).to be_truthy
    end
  end
end
