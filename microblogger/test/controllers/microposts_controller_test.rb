require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  def setup
    @microposts = microposts(:three)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post :create, micropost: { content: "test" }
    end
    assert_redirected_to login_url
  end

end
