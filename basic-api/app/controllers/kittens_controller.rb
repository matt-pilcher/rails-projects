class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  
  def show
    @kitten = Kitten.find(params[:id])
  end
  
  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.create(kitten_params)
  end
  
  def edit
  end
  
  private
    #Strong parameters
    def kitten_params
      params.require(:kitten).permit(:name, :age, :color)
    end
  
  
end
