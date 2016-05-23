require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create(:user)
    job = create(:post, user_id: user.id)
    
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'Can edit a post' do
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    find(:xpath, "//a[contains(@href, 'posts/1/edit')]").click
    
    fill_in 'Caption', with: "Editing this post"
    click_button 'Update Post'
    
    expect(page).to have_content("Updated successfully")
    expect(page).to have_content("Editing this post")
  end
end
