require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:subject) { create(:post, user: user ) }

  describe 'associations' do
    it { should belong_to(:category).optional }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).ignoring_case_sensitivity }
    it { should validate_length_of(:body).is_at_least(10) }
  end
end
