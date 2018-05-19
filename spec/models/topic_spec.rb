require 'rails_helper'

RSpec.describe Topic do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Raletionships' do
    it { should have_many(:user_topics) }
    it { should have_many(:users) }
    it { should have_many(:posts) }
  end
end