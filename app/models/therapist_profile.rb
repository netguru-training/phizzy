class TherapistProfile < ActiveRecord::Base
  before_save :conditional_validate
  has_one :user, as: :profilable

  

  private
  	def conditional_validate
  		unless new_record?
  			validates_presence_of :address, :hours_from, :hours_to, :user
  		end
  	end
end
