class CreateExercisePatients < ActiveRecord::Migration
  def change
    create_table :exercise_patient do |t|
      t.integer :exercise_id
      t.integer :patient_id
      t.integer :seriescount
      t.integer :repetitions

      t.timestamps null: false
    end
  end
end
