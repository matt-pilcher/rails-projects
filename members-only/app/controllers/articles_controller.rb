class ArticlesController < ApplicationController
  
  before_action :logged_in_user, only: [:index]
  
  def index
    @articles = Article.all
  end
  
  def new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
  end
  
  private
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login to to continue"
        redirect_to login_url
      end
    end
end
