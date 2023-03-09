class PagesController < ApplicationController
  def home
    # @no_navbar = true
  end

  def dashboard
    @places = current_user.places
    @menu_items = current_user.menu_items
  end

  def search
    if params[:query].present?
      @places = Place.search_category_name_address_cuisine(params[:query])
      if @places.empty?
        flash.now[:notice] = "No results found for '#{params[:query]}'!"
      end
    else
      @places = Place.all
    end
  end
end
