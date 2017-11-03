require 'rails_helper'

RSpec.describe TweetTag, type: :model do

  it { expect(subject).to validate_presence_of(:tweet) }
  it { expect(subject).to validate_presence_of(:tag) }

  it { expect(subject).to belong_to(:tweet) }
  it { expect(subject).to belong_to(:tag) }

end
