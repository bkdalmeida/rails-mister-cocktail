class DosesController < ApplicationController
  before_action :set_cocktail, only: [:create, :new]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_param)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_param
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end


