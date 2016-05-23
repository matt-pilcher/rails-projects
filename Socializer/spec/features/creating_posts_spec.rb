require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'New Post'
  end
  
  scenario 'can create a job' do
    attach_file('Image', "spec/files/images/test.jpg")
    fill_in 'Caption', with: 'Testing testing'
    click_button 'Create Post'
    expect(page).to have_content('Testing')
    expect(page).to have_css("img[src*='test.jpg']")
  end
  
  scenario 'needs an image to post' do
    fill_in 'Caption', with: 'My message without a pic'
    click_button 'Create Post'
    expect(page).to have_content("Image or caption field can't be blank")
  end
end