require 'rails_helper'

feature 'Editing posts' do
  background do
    job = create(:post)
    
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    find(:xpath, "//a[contains(@href, 'posts/1/edit')]").click
  end
  
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Editing this post"
    click_button 'Update Post'
    
    expect(page).to have_content("Updated successfully")
    expect(page).to have_content("Editing this post")
  end
end
