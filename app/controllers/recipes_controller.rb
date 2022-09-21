class RecipesController< ApplicationController
before_action :set_recipe, only: [:show, :edit, :update]
before_action :require_user, except: [:index,:show]
before_action :require_same_user, only: [:edit,:update,:destroy]

    def index
        @recipes=Recipe.paginate(page: params[:page],per_page: 5)
    end
    def new
        @recipe=Recipe.new
    end

    def create
        @recipe=Recipe.new(recipe_params)
        @recipe.chef=current_chef
        if @recipe.save
            flash[:success]="Recipe was created Successfully"
            redirect_to recipe_path(@recipe)
        else
            render 'new' , status: :unprocessable_entity
        end
    end


    def show
    end

    def edit
    end


    def update
        if @recipe.update(recipe_params)
            flash[:success]="Recipe was updates successfully"
            redirect_to recipe_path(@recipe)
        else
            render 'edit' , status: :unprocessable_entity
        end
    end


    def destroy
        @recipe=Recipe.find(params[:id]).destroy
        flash[:success]="Recipe was deleted successfully"
        redirect_to recipes_path , status: :see_other
    end

private

def set_recipe
    @recipe=Recipe.find(params[:id])
end

def recipe_params
    params.require(:recipe).permit(:name,:description)
end

def require_same_user
    if current_chef != @recipe.chef
        flash[:danger]="You can only edit or delete your own recipes"
        redirect_to recipes_path
    end
end

end