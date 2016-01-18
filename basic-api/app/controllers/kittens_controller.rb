class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to { |format| format.json { render json: @kittens }}
  end
  
  def show
    @kitten = Kitten.find(params[:id])
    respond_to { |format| format.json { render json: @kitten }}
  end
  
  
  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "New kitten added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten updated!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    @kitten = Kitten.find(params[:id]).destroy
    redirect_to root_path
  end
  
  private
    #Strong parameters
    def kitten_params
      params.require(:kitten).permit(:name, :age, :color)
    end
end
