require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:subject) { create(:tag) }

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_length_of(:name).is_at_most(15) }
  end
end
