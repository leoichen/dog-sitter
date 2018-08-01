class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [ :show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show
    else
      render_error
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render_error
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render_error
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :bio, :gender, :age, :language, :phone_number, :price, :image_url)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
