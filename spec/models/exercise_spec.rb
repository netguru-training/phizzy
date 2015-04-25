require 'rails_helper'

describe Exercise do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    end
  end
