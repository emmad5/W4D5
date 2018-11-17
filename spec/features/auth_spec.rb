require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do 
    visit new_user_path
  end
  scenario 'has a new user page' do 
    # save_and_open_page
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end
    
  feature 'signing up a user' do
    scenario 'shows email on the homepage after signup' do
      fill_in 'Email', with: 'test_email'
      fill_in 'Password', with: '123456'
      click_button 'Sign Up'
      
      expect(page).to have_content('test_email')
      
    end
  end
end

feature 'logging in' do
  let(:user) { FactoryBot.create(:user) }
  background :each do 
    visit new_session_path
  end

  
  scenario 'shows email on the homepage after login' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    # save_and_open_page
    expect(page).to have_content(user.email)
  end

end

feature 'logging out' do
  let(:user) { FactoryBot.create(:user) }
  background :each do
    visit user_url(user)
  end
  
  scenario 'begins with a logged out state' do
    click_button 'Log out'  
    # expect(session[:session_token]).not_to eq(user.session_token)
    expect(page).not_to have_content(user.email)
  end
  

  scenario 'doesn\'t show email on the homepage after logout' do
    click_button 'Log out'
    expect(page).not_to have_content(user.email)
  end

end