require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'index displays correct created job info' do
    job_one = create(:post, caption: "This is the first post")
    job_two = create(:post, caption: "Here is another one")
    
    visit '/'
    expect(page).to have_content("This is the first post")
    expect(page).to have_content("Here is another one")
    expect(page).to have_css("img[src*='test']")
  end
end