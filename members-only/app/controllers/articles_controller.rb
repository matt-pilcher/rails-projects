class ArticlesController < ApplicationController
  #Users must be logged in to view articles
  before_action :logged_in_user, only: [:index]
  #Only admins can create new articles
  before_action :admin_user, only: [:create, :new]
  
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
      unless current_user.admin?
        flash[:danger] = "Only admin are allowed to create new articles"
        redirect_to(articles_path)
      end
    end
end
