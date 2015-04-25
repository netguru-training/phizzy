class Exercise < ActiveRecord::Base
	has_many :exercise_patients

	validates_presence_of :name
	validates_presence_of :description
end
