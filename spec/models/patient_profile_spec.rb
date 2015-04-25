require 'rails_helper'

RSpec.describe PatientProfile, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:patient_profile)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
  end
end
