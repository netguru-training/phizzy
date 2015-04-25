require 'rails_helper'

RSpec.describe PatientProfile, type: :model do
  it "has a valid factory" do
    expect(build(:patient_profile)).to be_valid
  end

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:exercises) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "associations" do
    it { is_expected.to have_one(:user) }
    it { is_expected.to have_many(:exercise_patients) }
    it { is_expected.to have_many(:exercises) }
  end
end
