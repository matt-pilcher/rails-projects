require 'rails_helper'

feature 'Deleting posts' do
  background do
    job = create(:post)
    
    visit '/'
    find(:xpath, "//a[contains(@href, 'posts/1')]").click
  end
  
  scenario 'Delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted.')
    expect(page).to_not have_content('Incorrect display')
  end
end