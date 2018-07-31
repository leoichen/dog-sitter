class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end


  def create
    @service = Service.find(params[:service_id])
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
    @booking.dog = @dog

    if @booking.save
      render:show, status:created
    else
      render_error
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date,:end_date)
  end





end
