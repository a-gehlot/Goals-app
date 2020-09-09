require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Goals", type: :request do
    after(:all) { Warden.test_reset! }
    before(:each) do 
        @user = (FactoryBot.create(:user))
        login_as(@user)
    end


    describe 'GET #index' do
        it 'renders all user goals' do
            get user_goals_path
            expect(response).to be_successful
        end
    end

    describe 'POST #create' do
        it 'creates a new goal' do
            goal = FactoryBot.build(:goal, user: @user)
            post user_goals_path, params: { :goal => goal.attributes }
            expect(response).to redirect_to user_goal_path(Goal.last)
        end
    end

    describe 'GET #new' do
        it 'renders new page' do
            get new_user_goal_path
            expect(response).to render_template('new')
        end
    end

end
