require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:subject) { create(:tweet) }

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:body) }
    it { expect(subject).to validate_length_of(:body). is_at_most(140) }
    it { expect(subject).to have_many(:tags) }
    it { expect(subject).to have_many(:tweet_tags) }
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to accept_nested_attributes_for(:tags) }
  end

end
