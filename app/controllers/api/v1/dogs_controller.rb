#USER ID?
class Api::V1::DogsController < Api::V1::BaseController
  before_action :set_dog, only: [:update, :destroy]
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    # @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params)
    @dog.user = User.all.sample

    if @dog.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @dog.update(dog_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    if @dog.destroy
      render :index
    else
      render_error
    end
  end



  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:breed, :name, :gender, :age, :medical_history, :image_url)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
    status: :unprocessable_entity
  end
end
