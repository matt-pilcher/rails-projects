require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create(:user)
    job = create(:post, user_id: user.id)
    
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'Delete a single post' do
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Incorrect display')
  end
end