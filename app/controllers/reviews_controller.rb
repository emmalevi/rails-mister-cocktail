class ReviewsController < ApplicationController

  def new
    @review = Review.new
    set_cocktailid
  end

  def create
    @review = Review.new(review_params)
    set_cocktailid
    @review.cocktail = @cocktail
      if @review.save
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_cocktailid
  @cocktail = Cocktail.find(params[:cocktail_id])
  end


end
