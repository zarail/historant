class PagesController < ApplicationController
  def home
    # @no_navbar = true
  end

  def dashboard
    @places = current_user.places
    @menu_items = current_user.menu_items
  end
end
