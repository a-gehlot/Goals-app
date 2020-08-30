require 'rails_helper'


RSpec.describe "Goals", type: :request do
    describe 'GET #index' do
        it 'renders all goals' do
            get user_goals_path
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        it 'creates a new goal' do
            user = FactoryBot.create(:user)
            goal = FactoryBot.build(:goal, user: user)
            login_as(user)
            p goal.attributes
            post user_goals_path, params: { :goal => goal.attributes }
            expect(response).to redirect_to user_goal_path(user)
        end
    end
end
