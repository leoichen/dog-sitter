class Api::V1::BookingsController < Api::V1::BaseController
  def index
    # @user = User.find(params[:user_id])
    @service = Service.find(params[:service_id])
    @bookings = @service.bookings
  end

  def show
    # @service = Service.find(params[:service_id])
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      render :index
    else
      render_error
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date,:end_date, :service_id)
  end
end
