require 'rails_helper'

feature 'viewing user profiles' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'tester2@test.com',
                             user_name: 'tester2')
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2,
                             caption: 'Another post')
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  
  scenario 'a user can change their own profile details' do
    click_link 'myUsername'
    click_link 'Edit Profile'
    attach_file('user_avatar', 'spec/files/images/avatar.jpg')
    fill_in 'user_bio', with: 'Can I change my bio info?'
    click_button 'Update Profile'

    expect(page.current_path).to eq(profile_path('myUsername'))
    expect(page).to have_css("img[src*='avatar']")
    expect(page).to have_content('Can I change my bio info?')
  end

  scenario "an Edit Profile button is not displayed on another users profile" do
    click_link 'tester2'

    expect(page).to_not have_content('Edit Profile')
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    visit '/tester2/edit'

    expect(page).to_not have_content('Change your profile image:')
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("You don't have permission to access this page")
  end
end