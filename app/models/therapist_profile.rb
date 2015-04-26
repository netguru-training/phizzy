class TherapistProfile < ActiveRecord::Base
  has_one :user, as: :profilable
  has_many :patient_profiles

  validates_presence_of :address, :hours_from, :hours_to, :user
end

