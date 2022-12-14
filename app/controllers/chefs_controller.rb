class ChefsController < ApplicationController

before_action :set_chef , only: [:show,:edit,:update,:destroy] 
before_action :require_same_user, only: [:edit,:update,:destroy]

def index
    @chefs=Chef.paginate(page: params[:page],per_page: 5)
end

def new
    @chef=Chef.new
end

def create
    @chef=Chef.new(chef_params)
    if @chef.save
        session[:chef_id]=@chef.id
        flash[:success]="Welcome #{@chef.name} to MyRecipes"
        redirect_to chef_path(@chef)
    else
        render 'new' , status: :unprocessable_entity
    end
end

def show
    @chef_recipes=@chef.recipes.paginate(page: params[:page], per_page: 5)
end

def edit
end

def update
    
    if @chef.update(chef_params)
        flash[:success]="Your information was updated Successfully"
        redirect_to chef_path(@chef)
    else
        render 'edit', status: :unprocessable_entity
    end
end

def destroy
    @chef.destroy
    flash[:danger]="The chef was deleted successfully"
    redirect_to chefs_path, status: :see_other
end

private

def set_chef
    @chef=Chef.find(params[:id]) 
end

def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation)
end

def require_same_user
    if current_chef != @chef  and !current_chef.admin?
        flash[:danger]="You can only edit and delete your own account"
        redirect_to chefs_path
    end
end

end