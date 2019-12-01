class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
      # redirect_to 'cocktails/show' we want to stay on the page
    else
      render "cocktails/show"
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktails_path
  end
  # im finding the right dose id connected to cocktail
  # destroying it
  # redirect it to the show page of the same cocktail with arguments dose.coctail

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
