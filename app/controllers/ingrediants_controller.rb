class IngrediantsController < ApplicationController
    before_action :set_ingredients, only: [:show,:edit,:update]

    def new

    end

    def create

    end

    def create

    end

    def update

    end

    def show
        @ingrediant_recipes=@ingrediant.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @ingrediants=Ingrediant.paginate(page: params[:page], per_page: 5)
    end

    private

    def set_ingredients
        @ingrediant=Ingrediant.find(params[:id])
    end

end