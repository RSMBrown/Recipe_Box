Rails.application.routes.draw do
  root "recipes#index"

  resources :recipes do 
    resources :ratings
    resources :tags
  end 
  resources :ingredients

  get "tags/:tag", to: "recipe#show", as: :tag
  get "/search", to: "ingredients#search"
  get "/sorted", to: "ratings#sorted"
end
