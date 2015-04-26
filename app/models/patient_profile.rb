class PatientProfile < ActiveRecord::Base
  has_one :user, as: :profilable
  has_many :exercise_patients
  has_many :exercises, through: :exercise_patients
  belongs_to :therapist_profile

  validates_presence_of :user
end

