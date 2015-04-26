feature 'Index page' do
  context "when not signed in" do
    scenario 'visit the index page' do
      visit root_path
      expect(page).to have_content 'Valar morghulis'
    end

    scenario "sign up" do
      visit root_path
      click_link "Sign up"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Firstname", with: "Joe"
      fill_in "Lastname", with: "Doe"
      select("therapist", from: "user_profilable_type")
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context "when signed in" do
    let(:user) { create(:user) }
    before { login_as(user, scope: :user) }

    scenario "sign out" do
      visit root_path
      click_link "Sign out"
      expect(page).to have_content "Signed out successfully."
    end

    context "as a therapist" do
      let(:therapist_profile) { create(:therapist_profile) }
      let(:user) { create(:user, profilable: therapist_profile) }
      before { login_as(user, scope: :user) }

      scenario "visit the index page" do
        visit root_path
        expect(page).to have_content user.firstname
        expect(page).not_to have_content "Your therapist"
      end
    end

    context "as a patient" do
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
end

