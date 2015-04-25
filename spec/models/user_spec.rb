require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it { is_expected.to respond_to(:firstname) }
  it { is_expected.to respond_to(:lastname) }
  it { is_expected.to respond_to(:profilable) }
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
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

    describe "#exercises" do
      let(:exercises_result) { double }
      before do
        allow(user.profilable).to receive(:exercises).and_return(exercises_result)
      end

      it { expect(user.exercises).to eq exercises_result }
    end
  end
end
