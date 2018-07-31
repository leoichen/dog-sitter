class Api::V1::DogsController < Api::V1::BaseController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
    # @user = User.find(params[:user_id])
  end

  def create
    # @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user = User.all.sample

    if @dog.save
      # render :show, status: :created
    else
      render_error
    end
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

  def render_error

  render json: { errors: @restaurant.errors.full_messages },

    status: :unprocessable_entity

end


end
