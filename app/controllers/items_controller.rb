# require 'cloudinary'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    # Create a new item with the Cloudinary URL
    @item = Item.new(item_params)
    user = current_user
    @item.user = user
    if @item.save
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
