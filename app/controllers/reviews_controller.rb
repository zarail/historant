class ReviewsController < ApplicationController

  def new
    @menu_item = MenuItem.find(params[:menu_item_id])
    @review = Review.new
  end

  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    @review = Review.new(review_params)
    @review.menu_item = @menu_item
    if @review.save!
      redirect_to menu_item_path(@menu_item)
    else
      render :new, status: :unprocessable_entity # comment
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :visit_date, :rating)
  end
end
