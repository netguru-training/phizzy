class PatientProfile < ActiveRecord::Base
  has_one :user, as: :profilable
  has_many :exercise_patients, foreign_key: :patient_id
  has_many :exercises, through: :exercise_patients

  validates_presence_of :user
end
