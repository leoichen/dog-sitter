# DOUBLE CHECK

class Api::V1::ReviewsController < Api::V1::BaseController

  def index
    # @booking = Booking.find(params[:booking_id])
    # @reviews = @booking.reviews
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to root_path
    else
      render_error
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to root_path
    else
      render_error
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
    status: :unprocessable_entity
  end
end
