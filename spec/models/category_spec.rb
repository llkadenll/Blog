require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:subject) { create(:category) }

  describe 'associations' do
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { should validate_presence_of(:color) }
  end
end
