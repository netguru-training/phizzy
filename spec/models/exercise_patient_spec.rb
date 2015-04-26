require 'rails_helper'
 
describe ExercisePatient do
  it "has a valid factory" do
    expect(create(:exercise_patient)).to be_valid
  end

  describe "attributes" do
    it { is_expected.to respond_to(:series_count) }
    it { is_expected.to respond_to(:repetitions) }
  end

  describe 'validations' do
    it { should validate_presence_of :exercise_id }
    it { should validate_presence_of :patient_profile_id }
    it { should validate_presence_of :series_count }
    it { should validate_presence_of :repetitions }
  end

  describe "associations" do
    it { is_expected.to belong_to(:exercise) }
    it { is_expected.to belong_to(:patient_profile) }
  end
end

