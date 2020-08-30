require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email)}
  end
end

RSpec.describe Goal, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe '#is_private?' do
    it "should return true if method is private" do
      goal = FactoryBot.build(:goal)
      expect(goal.is_private?).to be true
    end
  end

end
