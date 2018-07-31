class ServicesController < ApplicationController
  before_action :set_service, only: [ :show, :edit, :update, :destroy]
  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.save

    redirect_to :root
  end

  def edit
  end

  def update
    @service.update(service_params)

    redirect_to :root
  end

  def destroy
    @service.destroy

    redirect_to :root
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:categories, :duration)
  end
end
