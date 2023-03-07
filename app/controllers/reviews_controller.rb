class ReviewsController < ApplicationController
  def create
    @reviews = Review.new(review_params)
    review.menu_item = @menu_item
    if reviews.save?
      redirect_to menu_item_path(@menu_item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(description, visit_date, rating)
  end
end
