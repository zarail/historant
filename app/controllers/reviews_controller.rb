class ReviewsController < ApplicationController
  def create
    @reviews = Review.new(review_params)
    if reviews.save?
      # redirect-@reviews
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

end
