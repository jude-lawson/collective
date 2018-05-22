require 'rails_helper'

RSpec.describe Topic do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Raletionships' do
    it { should have_many(:topic_contributions) }
    it { should have_many(:posts) }
    it { should belong_to(:user) }
  end
end
