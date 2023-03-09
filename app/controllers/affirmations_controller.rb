class AffirmationsController < ApplicationController
  def display
    @outfit = Outfit.find(params[:id])
  end
end
