class AffirmationsController < ApplicationController
  def display
    phrases = [
      "You're a fashionista!",
      "You have a great sense of style!",
      "Your fashion game is strong!",
      "You're a trendsetter!",
      "You're a style guru!",
    ];

    @affirmation = phrases.sample
    @outfit = Outfit.find(params[:id])
    @outfit.status = "accepted"
    @outfit.save
  end
end
