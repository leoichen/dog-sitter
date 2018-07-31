class ServicesController < ApplicationController
  before_action :set_user
  before_action :set_service, only: [ :show, :update, :destroy]
  def index
    @services = Service.all
  end

  def show
  end


  def create

    @service = Service.new(service_params)
    @service.user = @user
    @service.save

  end


  def update
    @service.update(service_params)
  end

  def destroy
    @service.destroy

    redirect_to :root
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:categories, :duration)
  end
end
