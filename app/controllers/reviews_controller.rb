class ReviewsController < ApplicationController
  def create
    @reviews = Review.new(review-params)
    if reviews.save?
      redirect-@reviews
    else
      render :new, :status unporcessable_entity
    end
  end

  private

end
