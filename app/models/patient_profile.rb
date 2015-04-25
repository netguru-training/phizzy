class PatientProfile < ActiveRecord::Base
  has_one :user, as: :profilable

  validates_presence_of :user
end
