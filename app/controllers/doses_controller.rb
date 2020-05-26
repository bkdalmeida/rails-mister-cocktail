class DosesController < ApplicationController
  before_action :set_cocktail
   def new
     @dose = Dose.new
   end

   def create
     @dose = Dose.new(dose_param)
     @dose.cocktail = @cocktail
     @dose.save
     if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
   end


   def delete
    @dose = Dose.find(params[:id])
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


