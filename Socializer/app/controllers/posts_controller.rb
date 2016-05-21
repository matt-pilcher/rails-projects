class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
end  

