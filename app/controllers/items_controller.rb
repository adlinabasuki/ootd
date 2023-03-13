# require 'cloudinary'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: Add fileter so only current users outfits are picked up

    # Below is just used so the dropdown know what to display
    @occasions_name = occasion_name_array
    type = params[:type]
    occasion = params[:occasion]
    no_types = type.nil? || type == ""
    no_occasions = occasion.nil? || occasion == ""

    if no_types && no_occasions
      @items = Item.all.where(user: current_user)
    elsif type != "" && no_occasions
      @items = Item.where(type: type).where(user: current_user)
    elsif no_types && occasion != ""
      occasion = Occasion.find_by_name(occasion)
      @items = Item.joins(:items_occasions).where(items_occasions: { occasion: occasion }).where(user: current_user)
    elsif occasion != "" && type != ""
      occasion = Occasion.find_by_name(occasion)
      @items = Item.joins(:items_occasions).where(items_occasions: { occasion: occasion }).and(Item.where(type: type)).where(user: current_user)
    else
      @items = nil
    end

    # this part rerender the index grid based on selections in the dropdown stored in @items
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.json { render json: @items.to_json }
      format.text { render partial: "items/index_grid", locals: { items: @items }, formats: [:html] }
    end
  end

  def new
    @item = Item.new
    @occasions_name = occasion_name_array
  end

  def create
    @item = Item.new(item_params)
    all_occasions = params[:item][:items_occasions].compact_blank
    @item.user = current_user
    if !@item.photo.attached?
      case @item.type
      when "TOP"
        @item.photo.attach(io: File.open("app/assets/images/tshirt.png"), filename: "tshirt.png", content_type: "image/png")
      when "BOTTOM"
        @item.photo.attach(io: File.open("app/assets/images/trousers.png"), filename: "trousers.png", content_type: "image/png")
      when "SHOE"
        @item.photo.attach(io: File.open("app/assets/images/sneakers.png"), filename: "sneakers.png", content_type: "image/png")
      end
    end
    if @item.save
      all_occasions.each do |occasion|
        ItemsOccasion.create(occasion_id: Occasion.find(occasion.to_i).id, item_id: @item.id)
      end
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @occasions = Occasion.joins(:items_occasions).where(items_occasions: { item: @item })
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end

  def edit
  end

  def update
    @item.update(item_params)

    redirect_to item_path(@item)
  end

  def destroy
    # CURRENTLY - when an item is destroyed, outfits that include that item are also destroyed (do we want this?)
    @item.destroy

    redirect_to items_path, status: :see_other
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :type, :photo)
  end

  def occasion_name_array
    @occasions = Occasion.all
    occasions_name = []
    @occasions.each do |occasion|
      occasions_name << occasion.name
    end
    return occasions_name
  end
end
