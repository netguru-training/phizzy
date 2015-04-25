FactoryGirl.define do
  factory :exercise_patient do
    exercise
    patient_profile
    series_count 1
    repetitions 1
  end

end
