class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    # define the new review
    @review = Review.new(review_params)
    # assign the restaurant
    @review.restaurant = @restaurant
    # save it
    if @review.save
      # redirect_to restaurant_show
      redirect_to @review.restaurant # makes a new request to the server
      # redirect_to restaurant_path(@review.restaurant)
    else
      render :new # gets the file and renders it with the new info
    end
  end

  private
   def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    # filters the user input to use only the correct ones
    params.require(:review).permit(:content, :rating)
  end
end

