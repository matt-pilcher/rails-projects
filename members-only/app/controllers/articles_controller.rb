class ArticlesController < ApplicationController
  
  before_action :logged_in_user, only: [:index]
  #before_action :admin_user, only: [:create]
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create 
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
  
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login to to continue"
        redirect_to login_url
      end
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
