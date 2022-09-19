Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  get '/recipes', to: 'recipes#index'
  get 'recipes/new', to: 'recipes#new',  as: 'new_recipe'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
  get 'recipes/:id/edit', to: 'recipes#edit'
  post '/recipes', to: 'recipes#create'
end
