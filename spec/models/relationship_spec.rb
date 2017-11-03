require 'rails_helper'

RSpec.describe Relationship, type: :model do

  it { expect(subject).to validate_presence_of(:leader) }
  it { expect(subject).to validate_presence_of(:follower) }

  it { expect(subject).to belong_to(:leader) }
  it { expect(subject).to belong_to(:follower) }

end
