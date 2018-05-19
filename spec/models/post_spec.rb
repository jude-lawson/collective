require 'rails_helper'

RSpec.describe Post do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'Validations' do
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end
end