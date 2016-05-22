require 'rails_helper'

feature 'Display an individual post' do
  scenario 'can click and display a post from the index' do
    post = create(:post)
    
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end