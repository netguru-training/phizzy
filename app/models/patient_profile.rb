class PatientProfile < ActiveRecord::Base
  before_save :conditional_validate
  has_one :user, as: :profilable
  has_many :exercise_patients
  has_many :exercises, through: :exercise_patients

  validates_presence_of :user

  private
  	def conditional_validate
  		unless new_record?
  			validates_presence_of :address, :hours_from, :hours_to, :user
  		end
  	end
end
