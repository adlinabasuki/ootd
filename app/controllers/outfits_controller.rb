class OutfitsController < ApplicationController
  def new
    # find the occasion instance (based on the user input)
    occasion_name = params[:occasion]
    selected_occasion = Occasion.find_by(name: occasion_name)
    # randomize outfit based on occasion
    # filter through collection of all tops with matching occasion
    @items = Item.joins(:items_occasions).where(items_occasions: { occasion: selected_occasion })
    @tops = @items.where(type: "Top")
    # select one top-occasion randomly
    @top = @tops.sample
    # filter through collection of all bottoms with matching occasion
    @bottoms = @items.where(type: "Bottom")
    # select one bottom-occasion randomly
    @bottom = @bottoms.sample
    # filter through collection of all shoes with matching occasion
    @shoes = @items.where(type: "Shoe")
    # select one shoe-occasion randomly
    @shoe = @shoes.sample

    # if @type is nil, randomize type from closet
    # result should return top, bottom and shoe that are tagged with selected occasion

    @user = current_user
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
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
