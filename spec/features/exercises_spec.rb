feature 'Exercises page' do
  let(:therapist_profile) { create(:therapist_profile) }
  let(:user) { create(:user, profilable: therapist_profile) }
  before { login_as(user, scope: user) }

  scenario "adding an exercise" do
    visit exercises_path
    click_link "Add a New Exercise"
    fill_in "Name", with: "Muscle-ups"
    fill_in "Description", with: "Lorem ipsum"
    click_button "Save"
    expect(page).to have_content "Muscle-ups"
  end
end

