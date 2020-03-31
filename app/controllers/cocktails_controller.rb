class CocktailsController < ApplicationController
   before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

def index
  @cocktails = Cocktail.all
end

def show
  @dose = Dose.new
  split = @cocktail.name.split
  @capitalized_name = split.map { |word| word.capitalize }.join(" ")
  @average_rating = calculate_cocktail_rating
end

def new
  @cocktail = Cocktail.new
end

def edit
end

def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully added!'
    else
      render :new
    end
end

def update
  @cocktail.update(cocktail_params)
end

def destroy
  @cocktail.destroy
  redirect_to cocktails_path, notice: "#{@cocktail.name} was successfully deleted."
end


private
  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :dose, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def calculate_cocktail_rating
    cocktail = set_cocktail
    number_of_reviews = cocktail.reviews.count
    sum_of_review_ratings = 0
    cocktail.reviews.each do |review|
      sum_of_review_ratings += review.rating
    end
    average_rating = sum_of_review_ratings / number_of_reviews.to_f
  end
end

