class RenamePatientColumnToExercisePatient < ActiveRecord::Migration
  def change
    rename_column :exercise_patients, :patient_id, :patient_profile_id
  end
end
