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
    
    first('.user-name').click_link 'myUsername'
  end

  scenario 'profile page shows the user name in the url' do
    expect(page.current_path).to eq(profile_path('myUsername'))
  end

  scenario "profile page only shows one user's posts" do
    expect(page).to have_content 'test'
    expect(page).to_not have_content 'Another post'
  end
end