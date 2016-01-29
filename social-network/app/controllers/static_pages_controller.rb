class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed
    else
      redirect_to new_user_path
    end
  end
end
