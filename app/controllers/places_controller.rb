class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = current_user.places
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
      flash.now[:success] = "The Place has been created"
    else
      flash.now[:error] = "Your data is not saved. Please provide valid data and try again."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @menu_items = @place.menu_items
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  def index
    if params[:query].present?
      @places = Place.search_category_name_address_cuisine(params[:query])
      if @places.empty?
        flash.now[:notice] = "No results found for '#{params[:query]}'!"
      end
    else
      @places = Place.all
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :cuisine, :category)
  end
end
