require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("This is the new user page!")
  end
  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      sign_up_new_user
      expect(page).to have_content("Welcome back newestuser")
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    expect(page).to have_content("Welcome back newestuser")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do

    expect(@current_user).to eq(nil)
  
  end

  scenario 'doesn\'t show username on the homepage after logout' do

  end

end