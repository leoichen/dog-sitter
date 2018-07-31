class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @@review.booking = @booking
  end

  def dog_params
    params.require(:review).permit(:content, :rating)
  end
end