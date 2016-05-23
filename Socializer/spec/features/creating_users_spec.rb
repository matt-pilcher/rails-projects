require 'rails_helper'

feature 'Creating a new user' do 
  background do
    visit '/'
    click_link 'Register'
  end
  
  scenario 'can create a new user' do
    fill_in 'Email', with: 'mivik@gmail.com'
    fill_in 'User name', with: 'mivik'
    fill_in 'Password', with: 'mypassword', match: :first
    fill_in 'Password confirmation', with: 'mypassword'
    
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  
  scenario 'expect a username to create an account' do
    fill_in 'Email', with: 'mivik@gmail.com'
    fill_in 'Password', with: 'mypassword', match: :first
    fill_in 'Password confirmation', with: 'mypassword'
    
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
end
    