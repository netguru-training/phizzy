require 'rails_helper'

RSpec.describe TherapistProfile, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:therapist_profile)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:hours_from) }
    it { is_expected.to validate_presence_of(:hours_to) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
