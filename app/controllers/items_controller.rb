# require 'cloudinary'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "items/index_grid", locals: { items: @items }, formats: [:html] }
    end
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end

  def new
    @item = Item.new
    @occasions = Occasion.all
    @occasions_name = []
    @occasions.each do |occasion|
      @occasions_name << occasion.name
    end
  end

  def create
    @item = Item.new(item_params)
    all_occasions = params[:item][:items_occasions].compact_blank
    @item.user = current_user
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :type, :photo)
  end
end
