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
      match "/footer_solutions", to: "snmmaurya#footer_solutions", via: :get
      match "/programmers/solutions/:solution_id/problems", to: "programmers/solutions#problems", via: :get
     end 
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
