require 'rails_helper'

RSpec.describe Comment do
  describe 'Validations' do
    it { should validate_presence_of(:body) }
  end
end