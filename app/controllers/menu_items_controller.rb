class MenuItemsController < ApplicationController
  before_action :set_place, only: [:new, :create]
  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_params)
    @menu_item.place = @place
    if menu_item.save
      redirect_to '/menu_items/:id'
      flash.now[:success] = "The menu item has been created"
    else
      render :new, status: :unprocessable_entity
      flash.now[:error] = "Your data is not saved. Please provide valid data and try again."
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def menu_params
    params.require(:menu_item).permit(:category, :name, :price)
  end
end
