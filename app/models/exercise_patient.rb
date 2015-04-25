class ExercisePatient < ActiveRecord::Base
	belongs_to :exercise
	belongs_to :patients_profile
	validates_presence_of :exercise_id
	validates_presence_of :patient_id
	validates_presence_of :series_count 
	validates_presence_of :repetitions

end
