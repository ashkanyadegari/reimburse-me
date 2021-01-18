Rails.application.routes.draw do
  devise_for :users
  post "/login", to: "login#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # user resources full CRUD
      resources :users
      put "/addcompany", to: "users#assign_to_company"

      # company resources full CRUD
      resources :companies

      # expense resources
      resources :expenses

      # project resources
      resources :projects
      #
      # category resources
      resources :categories
    end
  end
end
