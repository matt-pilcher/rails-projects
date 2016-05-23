require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end
  
  scenario 'can log in' do
    visit '/'
    expect(page).to_not have_content('New Post')
    
    click_link 'Login'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'foobar'
    click_button 'Log in'
    
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
  end
end