class CreatePatientProfiles < ActiveRecord::Migration
  def change
    create_table :patient_profiles do |t|

      t.timestamps null: false
    end
  end
end
