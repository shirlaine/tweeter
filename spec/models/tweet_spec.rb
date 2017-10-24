require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:body) }
    it { expect(subject).to validate_length_of(:body). is_at_most(140) }
  end
end
