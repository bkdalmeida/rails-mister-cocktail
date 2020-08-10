class CocktailsController < ApplicationController
  def index
    if params[:search]
      @cocktails = Cocktail.search_by_name(params[:search])
    else
    @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
