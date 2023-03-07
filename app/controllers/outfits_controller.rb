class OutfitsController < ApplicationController
  def new
  end

  def create
  end

  def dress_me
    @user = current_user
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end
end
