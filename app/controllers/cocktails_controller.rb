class CocktailsController < ApplicationController
    def index
        if params[:query].present?
            @cocktails = Cocktail.where(name: params[:query])
          else
            @cocktails = Cocktail.all
          end
    end

    def show
        @cocktail = Cocktail.find(params[:id])
        @doses = @cocktail.doses
        @ingredients = @cocktail.ingredients
    end

    def new
        @cocktail = Cocktail.new
        @dose = Dose.new
    end

    def create
        @cocktail = Cocktail.new(cocktail_params)
        if (@cocktail.save)
            redirect_to cocktail_path(@cocktail)
        else
            render 'new'
        end
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
    end
end
