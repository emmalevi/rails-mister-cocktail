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

  def calculate_cocktail_rating
    cocktail = self.cocktail
    number_of_reviews = cocktail.reviews.count
    sum_of_review_ratings = 0
    cocktail.reviews.each do |review|
      sum_of_review_ratings += review.rating
    end
    cocktail.average_rating = sum_of_review_ratings / number_of_reviews.to_f
    cocktail.save
  end
end
