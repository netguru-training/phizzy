class AddTherapistIdToPatientProfile < ActiveRecord::Migration
  def change
    add_column :patient_profiles, :therapist_profile_id, :integer
  end
end

