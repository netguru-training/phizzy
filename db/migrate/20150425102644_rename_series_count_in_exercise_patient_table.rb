class RenameSeriesCountInExercisePatientTable < ActiveRecord::Migration
  def change
    rename_column :exercise_patients, :seriescount, :series_count
  end
end
