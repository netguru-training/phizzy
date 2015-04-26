class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profilable, polymorphic: true

  validates_presence_of :firstname, :lastname

  def exercises
    profilable.exercises
  end

  def patients
    profilable.patient_profiles.map(&:user)
  end

  def therapist
    profilable.therapist_profile.user
  end
end

