require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    user = create :user
    
    job_one = create(:post, caption: "This is the first post", user_id: user.id)
    job_two = create(:post, caption: "Here is another one", user_id: user.id)

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'index displays correct created job info' do
    expect(page).to have_content("This is the first post")
    expect(page).to have_content("Here is another one")
    expect(page).to have_css("img[src*='test']")
  end
end