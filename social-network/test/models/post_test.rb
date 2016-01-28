require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:matt)
    @post = @user.posts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be no more than 5000 characters" do
    @post.content = "a" * 5001
    assert_not @post.valid?
  end

end
