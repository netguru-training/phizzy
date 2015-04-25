class ExercisePatient < ActiveRecord::Base
	belongs_to :exercise
	belongs_to :patient_profile
	validates_presence_of :exercise_id
	validates_presence_of :patient_profile_id
	validates_presence_of :series_count 
	validates_presence_of :repetitions

end
