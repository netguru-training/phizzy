require 'rails_helper'

describe Exercise do
  it "has a valid factory" do
    expect(create(:exercise)).to be_valid
  end

  describe "attributes" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:description) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "associations" do
    it { is_expected.to have_many(:exercise_patients) }
  end
end

