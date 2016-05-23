class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :protect_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path
    else
      flash.now[:alert] = "Image or caption field can't be blank"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Updated successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "Error! Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:image, :caption)
    end
    
    def set_post
      @post = Post.find(params[:id]) # Removing repeated code with this method
    end
    
    def post_protect
      unless current_user == @post.user
        flash[:alert] = "Unauthorized"
        redirect_to posts_path
      end
    end
end  

