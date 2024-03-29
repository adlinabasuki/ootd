class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
    @items_number = Item.where(user: current_user).count
    @outfits_number = Outfit.where(user: current_user).and(Outfit.where(status: "accepted")).count
  end
end
