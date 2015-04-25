require 'rails_helper'
 
describe ExercisePatient do
  describe 'validations' do
    it { should validate_presence_of :exercise_id }
    it { should validate_presence_of :patient_id }
    it { should validate_presence_of :series_count }
    it { should validate_presence_of :repetitions }
	
	end
  end
