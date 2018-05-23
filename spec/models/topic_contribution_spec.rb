require 'rails_helper'

RSpec.describe TopicContribution do
  describe 'Relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:topic) }
  end
end
