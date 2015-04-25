class ChangeHoursFormatToTherapistProfile < ActiveRecord::Migration
  def up
    change_column :therapist_profiles, :hours_from, :string
    change_column :therapist_profiles, :hours_to, :string
  end

  def down
    change_column :therapist_profiles, :hours_from, :time
    change_column :therapist_profiles, :hours_to, :time
  end
end
