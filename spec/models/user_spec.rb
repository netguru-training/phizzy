require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context "as a therapist" do
    let(:therapist_profile) { FactoryGirl.create(:therapist_profile) }

    before do
      user.profilable = therapist_profile
      user.save
    end

    it "has a valid profile" do
      expect(user.profilable).to eq therapist_profile
    end
  end

  context "as a patient" do
    let(:patient_profile) { FactoryGirl.create(:patient_profile) }

    before do
      user.profilable = patient_profile 
      user.save
    end

    it "has a valid profile" do
      expect(user.profilable).to eq patient_profile
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
  end
end
