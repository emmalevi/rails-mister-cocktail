class DosesController < ApplicationController

  def new
    @dose = Dose.new
    set_dose
  end

  def create
    set_dose
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Ingredient was successfully added.'
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
