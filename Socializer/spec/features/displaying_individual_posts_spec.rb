require 'rails_helper'

feature 'Display an individual post' do
  background do
    user = create :user

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    
    post = create(:post, user_id: user.id)
  end
  
  scenario 'can click and display a post from the index' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
  end
end