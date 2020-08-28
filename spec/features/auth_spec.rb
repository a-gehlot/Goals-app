require 'spec_helper'
require 'rails_helper'

describe 'the signup process' do
  it 'has a new user page' do
    visit '/users/sign_up'
    expect(page).to have_content 'Sign up'
  end
  describe 'signing up a user' do
    it 'redirects after successful sign-in' do
        visit '/users/sign_up'
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Sign up'
        expect(page).to have_current_path('/users')
    end

  end
end

describe 'logging in' do
  it 'shows username on the homepage after login' do
    user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: "#{user.password}"
    click_button 'Log in'
    expect(page).to have_content 'user@example.com'
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit '/'
    expect(page).to have_content 'Login'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: "#{user.email}"
    fill_in 'Password', with: "#{user.password}"
    click_button 'Log in'
    click_on 'Logout'
    expect(page).to_not have_content 'user@example.com'
  end

end