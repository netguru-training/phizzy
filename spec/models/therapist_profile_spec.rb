require 'rails_helper'

RSpec.describe TherapistProfile, type: :model do
  it "has a valid factory" do
    expect(build(:therapist_profile)).to be_valid
  end

  describe "attributes" do
    it { is_expected.to respond_to(:address) }
    it { is_expected.to respond_to(:hours_from) }
    it { is_expected.to respond_to(:hours_to) }
    it { is_expected.to respond_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:hours_from) }
    it { is_expected.to validate_presence_of(:hours_to) }
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "associations" do
    it { is_expected.to have_one(:user) }
    it { is_expected.to have_many(:patient_profiles) }
  end
end
