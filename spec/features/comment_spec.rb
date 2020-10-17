require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature "commenting", type: :feature do
    let!(:hello_world) { FactoryBot.create(:user, email: "hello_world@helloworld.com" )}
    let!(:foo) { FactoryBot.create(:user, email: "foo_bar@foo_bar.com")}
    let!(:goal) { FactoryBot.create(:goal, user: foo)}

    before(:each) do
        login_as hello_world
        visit user_path(foo)
    end

    after(:all) do
        Warden.test_reset!
    end

    shared_examples "comment" do
        it "should have a form for entering a new commment" do
            expect(page).to have_content "New Comment"
            expect(page).to have_field "comment"
        end

        it "should save comment upon submitting" do
            fill_in "comment", with: "new comment!"
            click_on "Save Comment"
            expect(page).to have_content "new comment!"
        end
    end

    describe "user profile comment" do
        it_behaves_like "comment"
    end

    describe "goal comment" do
        before(:each) do
            visit goals_path
            click_on goal.goal_title
        end

        it_behaves_like "comment"
    end
end







