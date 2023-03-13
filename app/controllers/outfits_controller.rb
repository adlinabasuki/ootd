class OutfitsController < ApplicationController
  def new
    # TODO: filter on users
    # find the occasion instance (based on the user input)
    @occasion_name = params[:occasion]
    selected_occasion = Occasion.find_by(name: @occasion_name)
    # randomize outfit based on occasion

    # filter through collection of all items with matching occasion
    @items = Item.joins(:items_occasions).where(items_occasions: { occasion: selected_occasion }).where(user: current_user)
    # filter through collection of all tops with matching occasion
    @tops = @items.where(type: "TOP")
    # select one top-occasion randomly
    @top = @tops.sample
    # filter through collection of all bottoms with matching occasion
    @bottoms = @items.where(type: "BOTTOM")
    # select one bottom-occasion randomly
    @bottom = @bottoms.sample
    # filter through collection of all shoes with matching occasion
    @shoes = @items.where(type: "SHOE")
    # select one shoe-occasion randomly
    @shoe = @shoes.sample

    # Creating an outfit
    @outfit = Outfit.create(user: current_user)
    OutfitsItem.create(
      item_id: @top.id,
      outfit_id: @outfit.id
    )
    OutfitsItem.create(
      item_id: @bottom.id,
      outfit_id: @outfit.id
    )
    OutfitsItem.create(
      item_id: @shoe.id,
      outfit_id: @outfit.id
    )
    # if @type is nil, randomize type from closet
    # result should return top, bottom and shoe that are tagged with selected occasion
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
