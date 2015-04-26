require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "attributes" do
    it { is_expected.to respond_to(:firstname) }
    it { is_expected.to respond_to(:lastname) }
    it { is_expected.to respond_to(:profilable) }
  end
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:profilable) }
  end

  context "as a therapist" do
    let(:therapist_profile) { create(:therapist_profile) }

    before do
      user.profilable = therapist_profile
      user.save
    end

    it "has a valid profile" do
      expect(user.profilable).to eq therapist_profile
    end

    describe "#therapist" do
      it { expect(user.therapist).to be_nil }
    end 

    describe "#patients" do
      let(:patient_user) { build(:user) }
      let(:patient_profiles_result) { [build(:patient_profile, user: patient_user)] }

      before do
        allow(user.profilable).to receive(:patient_profiles).and_return(patient_profiles_result)
      end

      it { expect(user.patients).to eq [patient_user] }
    end
  end

  context "as a patient" do
    let(:patient_profile) { create(:patient_profile) }

    before do
      user.profilable = patient_profile 
      user.save
    end

    it "has a valid profile" do
      expect(user.profilable).to eq patient_profile
    end

    describe "#therapist" do
      let(:therapist_user) { build(:user) }
      let(:therapist_result) { build(:therapist_profile, user: therapist_user) }

      before do
        allow(user.profilable).to receive(:therapist_profile).and_return(therapist_result)
      end

      it { expect(user.therapist).to eq therapist_user }
    end

    describe "#therapist=" do
      let(:therapist_profile) { create(:therapist_profile) }
      before do
        user.therapist = therapist_profile.user
      end

      it { expect(user.therapist).to eq therapist_profile.user }
    end

    describe "#patients" do
      it { expect(user.patients).to be_nil }
    end

    describe "#exercises" do
      let(:exercises_result) { double }

      before do
        allow(user.profilable).to receive(:exercises).and_return(exercises_result)
      end

      it { expect(user.exercises).to eq exercises_result }
    end
  end
end
