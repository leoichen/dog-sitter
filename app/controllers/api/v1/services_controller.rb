class Api::V1::ServicesController < Api::V1::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def create
    @service = Service.new(service_params)
    @service.user = User.all.sample
    if @service.save
      redirect_to root_path
    else
      render_error
    end
  end

  def update
    @service.update(service_params)

    redirect_to root_path
  end

  def destroy
    @service.destroy

    redirect_to root_path
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:categories, :duration)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
    status: :unprocessable_entity
  end
end
