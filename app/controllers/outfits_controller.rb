class OutfitsController < ApplicationController
  def new
    # find the occasion instance (based on the user input)
    @occasion_name = params[:occasion]
    selected_occasion = Occasion.find_by(name: @occasion_name)

    weather_descriptions_dry = ["Clear", "Clouds"]
    weather_descriptions_rainy = ["Thunderstorm", "Drizzle", "Rain", "Snow", "Atmosphere"]

    description = params[:description]
    condition = weather_descriptions_rainy.include?(description) ? "rainy" : "dry"

    temperature =  params[:temperature].to_i
    if temperature < 11
      temp = "cold"
    elsif temperature >= 11 && temperature < 25
      temp = "medium warm"
    elsif temperature >= 25
      temp = "hot"
    end

    # randomize outfit based on occasion

    # filter through collection of all items with matching occasion
    @items = Item.joins(:items_occasions).where(items_occasions: { occasion: selected_occasion }).where(user: current_user)

    @weather_items = @items.joins(:items_weathers).where(items_weathers: {name: "#{condition} and #{temp}"})
    # filter through collection of all tops with matching occasion

    @tops = @items.where(type: "TOP")
    # select one top-occasion randomly unless there is a bottom with the weather condition of today
    if @weather_items.where(type: "TOP").any?
      @top = @weather_items.where(type: "TOP").sample
    else
      @top = @tops.sample
    end
    # filter through collection of all bottoms with matching occasion
    @bottoms = @items.where(type: "BOTTOM")
    # select one bottom-occasion randomly unless there is a bottom with the weather condition of today
    if @weather_items.where(type: "BOTTOM").any?
      @bottom = @weather_items.where(type: "BOTTOM").sample
    else
      @bottom = @bottoms.sample
    end
    # filter through collection of all shoes with matching occasion
    @shoes = @items.where(type: "SHOE")
    # select one shoe-occasion randomly unless there is a bottom with the weather condition of today
    if @weather_items.where(type: "SHOE").any?
      @shoe = @weather_items.where(type: "SHOE").sample
    else
      @shoe = @shoes.sample
    end

    # Creating an outfit
    unless @top.nil? || @bottom.nil? || @shoe.nil?
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
    end
  end

  def dress_me
    @user = current_user
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end

  private

  # Method to generate a new outfit (not save), return a hash {top: @top, bottom: @bottom, shoe: @shoe}
  def generate_new_outfit(items)
    outfit_hash = {}
    @tops = items.where(type: "TOP")
    # select one top-occasion randomly
    @top = @tops.sample
    # filter through collection of all bottoms with matching occasion
    @bottoms = items.where(type: "BOTTOM")
    # select one bottom-occasion randomly
    @bottom = @bottoms.sample
    # filter through collection of all shoes with matching occasion
    @shoes = items.where(type: "SHOE")
    # select one shoe-occasion randomly
    @shoe = @shoes.sample
    outfit_hash[top] = @top
    outfit_hash[bottom] = @bottom
    outfit_hash[shoe] = @shoe
    return outfit_hash
  end

end
