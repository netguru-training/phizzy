feature 'Index page' do
  context "when not signed in" do
    scenario 'visit the index page' do
      visit root_path
      expect(page).to have_content 'Valar morghulis'
    end
  end

  context "when signed in as a therapist" do
    let(:therapist_profile) { create(:therapist_profile) }
    let(:user) { create(:user, profilable: therapist_profile) }
    before { login_as(user, scope: :user) }

    scenario "visit the index page" do
      visit root_path
      expect(page).to have_content user.firstname
      expect(page).not_to have_content "Your therapist"
    end
  end

  context "when signed in as a patient" do
    let(:patient_profile) { create(:patient_profile) }
    let(:user) { create(:user, profilable: patient_profile) }
    before { login_as(user, scope: :user) }

    scenario "visit the index page" do
      visit root_path
      expect(page).to have_content user.firstname
      expect(page).to have_content "Your therapist"
    end
  end
end

