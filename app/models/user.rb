class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profilable, polymorphic: true

  validates_presence_of :firstname, :lastname

  def exercises
    profilable.exercises if profilable_type == "PatientProfile"
  end

  def patients
    return nil unless profilable.patient_profiles
    profilable.patient_profiles.map(&:user) if profilable_type == "TherapistProfile"
  end

  def therapist
    return nil unless profilable.therapist_profile
    profilable.therapist_profile.user if profilable_type == "PatientProfile"
  end
end

