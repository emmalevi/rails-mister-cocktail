class CocktailsController < ApplicationController
   before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

def index
  @cocktails = Cocktail.all
end

def show
  @dose = Dose.new
  split = @cocktail.name.split
  @capitalized_name = split.map { |word| word.capitalize }.join(" ")
end

def new
  @cocktails = Cocktail.new
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
end

