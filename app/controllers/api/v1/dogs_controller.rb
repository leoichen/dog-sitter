class DogsController < ApplicationController

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user = @user
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
  end



  private
  def dog_params
    params.require(:dog).permit(:breed, :name, :gender, :age, :medical_history)
  end



end
