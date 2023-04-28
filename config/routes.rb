Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :jobs
      end
      resources :users do
        resources :biodata
        resources :educations
        resources :experiences
        resources :skills
        resources :profiles
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "api/v1/jobs#index"
end
