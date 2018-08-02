class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    if params[:query].present?
      @users = User.joins(:services).where("services.categories LIKE ?", params[:query])
    else
      @users = User.all
    end
  end

  def show
    @users = User.where.not(latitude: nil, longitude: nil)
  end

  def create
    if User.all.any? {|user| user.first_name == params[:user][:first_name]}
      @user = User.find_by(first_name: params[:user][:first_name])
      redirect_to api_v1_user_path(@user)
    else
      @user = User.new(user_params)
      if @user.save
        render :show
      else
        render json: { errors: @user.errors.full_messages },
          status: :unprocessable_entity
      end
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :bio, :gender, :age, :language, :phone_number, :price, :image_url, :latitude, :longitude)
  end
end
