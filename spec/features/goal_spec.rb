require 'rails_helper'
include Warden::Test::Helpers


RSpec.feature "Goals", type: :feature do
  describe 'CRUD of goals' do
    after(:each) do 
      Warden.test_reset!
    end

    before(:each) do 
        @user = (FactoryBot.create(:user))
        login_as(@user)
    end
    
    describe 'creating goals' do
      it 'should allow a signed-in user to create a new goal' do
        visit new_goal_path
        fill_in 'Title', with: 'First goal!!'
        fill_in 'Description', with: 'Test description'
        select 'Public', from: 'goal_public'
        select 'Not Completed', from: 'goal_completed'
        click_button('Submit')
        expect(page).to have_text('Goal saved')
        end
      end

      context 'with a created goal' do
        before(:each) do
          visit new_goal_path
          fill_in 'Title', with: 'First goal!'
          fill_in 'Description', with: 'Test description'
          select 'Public', from: 'goal_public'
          select 'Not Completed', from: 'goal_completed'
          click_button('Submit')
        end


          describe 'showing goals' do
            it 'should allow the user to see his/her goals' do
              visit user_path(@user)
              expect(page).to have_text('First goal!')
            end
          end

          describe 'updating goals' do
            it 'should bring user to the edit page' do
              visit edit_goal_path(@user.goals.last)
              expect(page).to have_text('Edit First goal!')
            end

            it 'should allow user to change goal' do
              visit edit_goal_path(@user.goals.last)
              fill_in 'Title', with: 'Updated goal'
              fill_in 'Description', with: 'Updated description'
              select 'Completed', from: 'goal_completed'
              click_button('Submit')
              expect(page).to have_text('Updated description')
            end

            it 'should not allow a different user to update goal' do
              logout
              @user = FactoryBot.create(:user)
              login_as(@user)
              visit edit_goal_path(Goal.last)
              expect(page).to_not have_text('Edit First goal!')
            end

          end

          describe 'deleting goals' do
            it 'should allow user to delete a goal' do
              visit user_path(@user)
              find_button('Delete').click
              expect(page).to_not have_text('First goal!')
            end

          end
        end
  end
end
