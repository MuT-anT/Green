class IngrediantsController < ApplicationController
    before_action :set_ingredients, only: [:show,:edit,:update]
    before_action :require_admin, except: [:show,:index]

    def new
        @ingrediant=Ingrediant.new
    end

    def create
        @ingrediant=Ingrediant.new(ingrediant_params)
        if @ingrediant.save
            flash[:success]="Ingrediant was added Successfully"
            redirect_to ingrediant_path(@ingrediant)
        else
            render 'new' , status: :unprocessable_entity
        end
    end

    def update
        if @ingrediant.update(ingrediant_params)
            flash[:success]="Ingrediant was updated successfully"
            redirect_to ingrediant_path(@ingrediant)
        else
            render 'edit' , status: :unprocessable_entity
        end
    end

    def show
        @ingrediant_recipes=@ingrediant.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @ingrediants=Ingrediant.paginate(page: params[:page], per_page: 6)
    end

    private

    def set_ingredients
        @ingrediant=Ingrediant.find(params[:id])
    end


private

def ingrediant_params
    params.require(:ingrediant).permit(:name)
end

def require_admin
    if !logged_in? || (logged_in? and !current_chef.admin?)
        flash[:danger]="Only admin user can perform this action"
        redirect_to ingrediants_path
    end
end

end