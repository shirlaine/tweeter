require 'rails_helper'

RSpec.describe User, type: :model do

  let (:subject) { create(:user) }

  it { expect(subject).to validate_presence_of(:username) }
  it { expect(subject).to validate_presence_of(:fullname) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_presence_of(:password) }

  it { expect(subject).to validate_uniqueness_of(:username) }
  it { expect(subject).to validate_uniqueness_of(:email).case_insensitive }

  it { expect(subject).to validate_length_of(:username).is_at_least(3) }
  it { expect(subject).to validate_length_of(:username).is_at_most(15) }
  it { expect(subject).to validate_length_of(:fullname).is_at_least(3) }
  it { expect(subject).to validate_length_of(:fullname).is_at_most(15) }
  it { expect(subject).to validate_length_of(:password).is_at_least(6) }

  it { expect(subject).to have_many(:tweets) }
  it { expect(subject).to have_many(:relationships) }
  it { expect(subject).to have_many(:leaders) }
  it { expect(subject).to have_many(:reverse_relationships) }
  it { expect(subject).to have_many(:followers) }

end
