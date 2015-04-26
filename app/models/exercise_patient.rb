class ExercisePatient < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :patient_profile
  validates_presence_of :exercise_id, :patient_profile_id, :series_count, :repetitions
end

