Rails.application.routes.draw do  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'snmmaurya#index'


  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}

  match "/edit_email", to: "devise/users#edit_email", via: :get
  match "/update_email", to: "devise/users#edit_email", via: :post

  #-- custom routes --#
  match "/download_resume", to: "snmmaurya#download_resume", via: :get
  match "/thank_you", to: "snmmaurya#thank_you", via: :get
  match "/downloads", to: "snmmaurya#downloads", via: :get
  match "/solutions", to: "snmmaurya#solutions", via: :get
  match "/contact", to: "snmmaurya#contact", via: :get
  match "/create_contact", to: "snmmaurya#create_contact", via: :post
  match "/portfolios", to: "snmmaurya#portfolios", via: :get
  match "/portfolios/:id", to: "snmmaurya#portfolio", via: :get ,as: :portfolio
  match "/about", to: "snmmaurya#about", via: :get
  # resources :portfolios

  resources :errors, only: :index

  constraints(:id => /[^\/]+/) do
    namespace :programmers do
      resources :solutions do
        resources :problems do
          resources :answers do
          end
        end
      end
    end
  end

  namespace :profile do
    resources :users
  end

  namespace :studies do
    resources :books do
      resources :lessions
    end
  end

  namespace :administrator do
    resources :portfolios
    resources :employments
    resources :educations
    resources :technologies
    resources :developments
    resources :apis
    namespace :about do
      resources :employments
    end
  end

  resources :lives
  resources :posts
  
  namespace :hospitals do
    resources :doctors
    resources :patients
    resources :appointments
  end  


#------------------------------ API with AngularJS --------------------------------------#
  namespace :api do
    namespace :v1 do
      match "/studies_books_api", to: "studies_books_api#index", via: :get
      match "/get_current_user", to: "snmmaurya#get_current_user", via: :get
      match "/home", to: "snmmaurya#home", via: :get
      match "/about", to: "snmmaurya#about", via: :get
      match "/portfolios", to: "snmmaurya#portfolios", via: :get
      match "/portfolios/:id", to: "snmmaurya#portfolio", via: :get
      match "/footer_solutions", to: "snmmaurya#footer_solutions", via: :get
      match "/programmers/solutions", to: "programmers/solutions#index", via: :get
      match "/contact", to: "snmmaurya#contact", via: :post
      match "/lives/directives", to: "lives#directives", via: :get
      # match "/programmers/solution/:solution_id/problems", to: "programmers/problems#index", via: :get
      # match "/programmers/solution/:solution_id/problem/:problem_id/answers", to: "programmers/answers#index", via: :get
      # match "/programmers/solutions", to: "programmers/solutions#index", via: :get
      namespace :programmers do
        resources :solutions do 
          resources :problems do
            resources :answers
          end  
        end        
      end

      namespace :profile do
        resources :users
      end
      namespace :studies do
        resources :books do
          resources :lessions
        end  
      end  

      resources :movies
      resources :livecruds
     end 
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  end
