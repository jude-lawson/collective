require 'rails_helper'

RSpec.describe Topic do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end
end