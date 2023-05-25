Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :save_questions
      resources :save_email_invitations 
      post '/send_interview_invitation', to: 'emails#send_email_for_interview'
      get '/users_interview', to: 'users#interview_index'
      resources :jobscreenings do
        member do
          get 'show_applicants_per_job'
        end
      end
      resources :companies do
        resources :jobs
      end
      resources :jobapplications
      resources :jobs do
        member do
          get 'show_applicant_count'
          get 'show_applicants'
        end
      end
      resources :users do
        resources :biodata
        resources :educations
        resources :experiences
        resources :skills
        resources :profiles
        resources :jobapplications
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "api/v1/jobs#index"
end
