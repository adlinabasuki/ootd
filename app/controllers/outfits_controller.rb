class OutfitsController < ApplicationController
  def dress_me
    @user = current_user
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end

  def index
    @outfits = Outfit.all.where(status: "accepted").where(user: current_user)
  end

  def show
    @outfit = Outfit.find(params[:id])
    @top = @outfit.items.find_by(type: "TOP")
    @bottom = @outfit.items.find_by(type: "BOTTOM")
    @shoe = @outfit.items.find_by(type: "SHOE")
  end

  def new
    @occasion_name = params[:occasion]
    selected_occasion = Occasion.find_by(name: @occasion_name)

    weather_name = get_weather_name

    @items = Item.joins(:items_occasions).where(items_occasions: { occasion: selected_occasion }).where(user: current_user)

    @weather_items = @items.joins(:items_weathers).where(items_weathers: { name: weather_name })

    if items_of_all_types(@weather_items)
      @outfits = outfits_meet_condition(selected_occasion, weather_name)

      if @outfits.nil?
        @outfit_hash = generate_new_outfit_hash(@items, @weather_items)
      else
        number = rand(1..100)
        if number < 31
          @outfit = @outfits.select { |outfit| outfit.status = "accepted" }.sample
          @outfit_hash = generate_new_outfit_hash(@items, @weather_items) if @outfit.nil?
        elsif number > 90
          @outfit = @outfits.select { |outfit| outfit.status = "rejected" }.sample
          @outfit_hash = generate_new_outfit_hash(@items, @weather_items) if @outfit.nil?
        else
          @outfit_hash = generate_new_outfit_hash(@items, @weather_items)
        end
      end
      if @outfit.nil?
        @outfit = check_if_outfit_exist(@outfit_hash)
        @outfit = create_outfit(@outfit_hash) if @outfit.nil?
      end
      # Set @top, @bottom, @shoe for the view
      @top = (@outfit.items.select { |item| item.type == "TOP" }).first
      @bottom = (@outfit.items.select { |item| item.type == "BOTTOM" }).first
      @shoe = (@outfit.items.select { |item| item.type == "SHOE" }).first

    else
      @top = nil
      @bottom = nil
      @shoe = nil
    end
  end

  private

  def get_weather_name
    # weather_descriptions_dry = ["Clear", "Clouds"]
    weather_descriptions_rainy = ["Thunderstorm", "Drizzle", "Rain", "Snow", "Atmosphere"]

    description = params[:description]
    description = "Clouds" if description.nil?
    condition = weather_descriptions_rainy.include?(description) ? "rainy" : "dry"

    temperature = params[:temperature].to_i
    temperature = 22 if temperature.nil?
    if temperature < 11
      temp = "cold"
    elsif temperature >= 11 && temperature < 25
      temp = "medium warm"
    elsif temperature >= 25
      temp = "hot"
    end
    weather_name = "#{condition} and #{temp}"
    return weather_name
  end

  def items_of_all_types(items)
    top_exist = false
    bottom_exist = false
    shoe_exist = false

    items.each do |item|
      case item.type
      when "TOP"
        top_exist = true
      when "BOTTOM"
        bottom_exist = true
      when "SHOE"
        shoe_exist = true
      end
    end
    top_exist == true && bottom_exist == true && shoe_exist == true
  end

  def outfits_meet_condition(occasion, weather_name)
    user_outfits = Outfit.where(user: current_user)
    @outfits_occasions = user_outfits.select { |outfit| outfit.occasions.include?(occasion) }
    # @outfits_occasions = Outfit.all.select { |outfit| outfit.occasions.include?(occasion) }
    @outfits = @outfits_occasions.select { |outfit| outfit.items_weathers.include?(weather_name) }
  end

  # Return a hash {top: @top, bottom: @bottom, shoe: @shoe}
  def generate_new_outfit_hash(items, weather_items)
    outfit_hash = {}

    @tops = items.where(type: "TOP")
    weather_items.where(type: "TOP").any? ? @top = weather_items.where(type: "TOP").sample : @top = @tops.sample

    @bottoms = items.where(type: "BOTTOM")
    weather_items.where(type: "BOTTOM").any? ? @bottom = weather_items.where(type: "BOTTOM").sample : @bottom = @bottoms.sample

    @shoes = items.where(type: "SHOE")
    weather_items.where(type: "SHOE").any? ? @shoe = weather_items.where(type: "SHOE").sample : @shoe = @shoes.sample

    outfit_hash[:top] = @top
    outfit_hash[:bottom] = @bottom
    outfit_hash[:shoe] = @shoe
    return outfit_hash
  end

  def check_if_outfit_exist(outfit_hash)
    all_outfits = Outfit.where(user: current_user)
    all_outfits.each do |outfit|
      top = outfit.items.where(type: "TOP")
      bottom = outfit.items.where(type: "BOTTOM")
      shoe = outfit.items.where(type: "SHOE")
      return outfit if top == outfit_hash[:top] && bottom == outfit_hash[:bottom] && shoe == outfit_hash[:shoe]
    end
    return nil
  end

  def create_outfit(outfit_hash)
    outfit = Outfit.create(user: current_user)
    top = outfit_hash[:top]
    bottom = outfit_hash[:bottom]
    shoe = outfit_hash[:shoe]

    OutfitsItem.create( item_id: top.id, outfit_id: outfit.id)
    OutfitsItem.create( item_id: bottom.id, outfit_id: outfit.id)
    OutfitsItem.create(item_id: shoe.id, outfit_id: outfit.id)
    return outfit
  end
end
