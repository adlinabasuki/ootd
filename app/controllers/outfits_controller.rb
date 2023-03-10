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
    @outfits = Outfit.all
  end

  def new
    # find the occasion instance (based on the user input)
    @occasion_name = params[:occasion]
    selected_occasion = Occasion.find_by(name: @occasion_name)

    # Find all items that fit's the criteria (currently only based on occasion and user) - used for generate_new_outfit_hash
    @items = Item.joins(:items_occasions).where(items_occasions: { occasion: selected_occasion }).where(user: current_user)

    # Verify we have items for all types for the occasion
    if items_of_all_types(@items)
      # Check if there is any outfits that meet the occasion - return list of outfits that meet the criteria @outfits
      @outfits = outfits_meet_condition(selected_occasion)

      if @outfits != nil
        # If outfits for that occasion exist - generate a number between 1 and 100
        number = rand(1..100)
        @source = number
        # If number is between 1 and 60 - select a sample @outfit of all accepted outfits from @outfits
        if number < 31
          @outfit = @outfits.select { |outfit| outfit.status = "accepted" }.sample
          # If no accepted outfits - generate a new one
          if @outfit.nil?
            @outfit_hash = generate_new_outfit_hash(@items)
          end
          # If number is between 91 and 100 - select a sample @outfit of all rejected outfits from @outfits
        elsif number > 90
          @outfit = @outfits.select { |outfit| outfit.status = "rejected"}.sample
          # If no rejected outfits - generate a new one
          if @outfit.nil?
            @outfit_hash = generate_new_outfit_hash(@items)
          end
          # If number is between 61 and 90 - generate a new outfit @outfit = generate_outfit
        else
          @outfit_hash = generate_new_outfit_hash(@items)
        end
      # If no outfit for that occasion exist - generate a new outfit
      else
        @outfit_hash = generate_new_outfit_hash(@items)
      end

      # If @outfit is already an instance of an outfit, or if it already exist as an instance of an outfit we don't need to do anything
      if @outfit.nil?
        # Check if the outfit already exist
        @outfit = check_if_outfit_exist(@outfit_hash)
        if @outfit == nil
          # If yes: do nothing, ff no: create a new one in the DB and assign it @outfit
          @outfit = create_outfit(@outfit_hash)
        end
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

  # Verify we have items of all types for the occasion. Input: Items that meet the criteria. Output: true/false
  def items_of_all_types(items)
    top_exist = false
    bottom_exist = false
    shoe_exist = false

    items.each do |item|
      if item.type == "TOP"
        top_exist = true
      elsif item.type == "BOTTOM"
        bottom_exist = true
      else
        shoe_exist = true
      end
    end
    if top_exist == true && bottom_exist == true && shoe_exist == true
      true
    else
      false
    end
  end

  # Check if there are any outfits that meet the condition. Input: occasion. Return: Array of occasions that meet the condition @outfits
  def outfits_meet_condition(occasion)
    @outfits = Outfit.all.select { |outfit| outfit.occasions.include?(occasion) }
  end

  # Method to generate a new outfit (not save), return a hash {top: @top, bottom: @bottom, shoe: @shoe}
  def generate_new_outfit_hash(items)
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
    outfit_hash[:top] = @top
    outfit_hash[:bottom] = @bottom
    outfit_hash[:shoe] = @shoe
    return outfit_hash
  end

  # Check if an outfit exist, passing a hash
  # TODO: Update so this function take a hash of items instead of an instance of an ooutfit
  def check_if_outfit_exist(outfit_hash)
    all_outfits = Outfit.all
    all_outfits.each do |outfit|
      top = outfit.items.where(type: "TOP")
      bottom = outfit.items.where(type: "BOTTOM")
      shoe = outfit.items.where(type: "SHOE")
      if top == outfit_hash[:top] && bottom == outfit_hash[:bottom] && shoe == outfit_hash[:shoe]
        return outfit
      end
    end
    return nil
  end


  # Creating an instance of an outfit in DB, input is a hash with 3 items
  def create_outfit(outfit_hash)
    outfit = Outfit.create(user: current_user)
    top = outfit_hash[:top]
    bottom = outfit_hash[:bottom]
    shoe = outfit_hash[:shoe]

    OutfitsItem.create(
      item_id: top.id,
      outfit_id: outfit.id
    )
    OutfitsItem.create(
      item_id: bottom.id,
      outfit_id: outfit.id
    )
    OutfitsItem.create(
      item_id: shoe.id,
      outfit_id: outfit.id
    )
    return outfit

  end
end
