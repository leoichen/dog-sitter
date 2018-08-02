class Api::V1::ServicesController < Api::V1::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render :show
    else
      render_error
    end
  end

  def update
    if @service.update(service_params)
      render :show
    else
      render json: { errors: @service.errors.full_messages },
        status: :unprocessable_entity
    end
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
    params.require(:service).permit(:categories, :duration, :user_id)
  end

  def render_error
    render json: { errors: @service.errors.full_messages },
      status: :unprocessable_entity
  end
end
