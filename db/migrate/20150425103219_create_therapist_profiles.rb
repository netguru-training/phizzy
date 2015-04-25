class CreateTherapistProfiles < ActiveRecord::Migration
  def change
    create_table :therapist_profiles do |t|
      t.string :address
      t.time :hours_from
      t.time :hours_to

      t.timestamps null: false
    end
  end
end
