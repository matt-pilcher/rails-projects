require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/test.jpg")
    fill_in 'Caption', with: 'Testing testing'
    click_button 'Create Post'
    expect(page).to have_content('Testing')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end