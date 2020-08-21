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
    it 'shows username on the homepage after signup' do
        expect(page).to have_content 'user@example.com'
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end