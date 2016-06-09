require 'rails_helper'

feature 'Posting comments' do
  background do
    user = create :user
    job = create(:post, user_id: user.id)
    
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'can leave a comment' do
    visit '/'
    fill_in "comment_content_#{post.id}", with: "My insightful comment"
    click_button 'submit'
    
    expect(page).to have_content('My insightful comment')
  end
end
