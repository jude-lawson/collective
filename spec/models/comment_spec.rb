require 'rails_helper'

RSpec.describe Comment do
  describe 'Validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'Relationships' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end