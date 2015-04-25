require 'rails_helper'

RSpec.describe TherapistProfile, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:therapist_profile)).to be_valid
  end
end
