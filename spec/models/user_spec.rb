require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:is_teacher) }
  end

  describe 'Relationships' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:user_topics) }
    it { should have_many(:topics) }
  end
end