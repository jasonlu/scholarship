Scholarship::Application.routes.draw do
  

  

  #resources :carts


  

  resources :pages


  resources :site_configs

  devise_for :users, :controllers => { :registrations => "registrations" }
  

  #resources :user_profiles
  
  get 'profile', :to => 'user_profiles#show', :as => :user_profiles
  get 'profile', :to => 'user_profiles#show', :as => :user_profile
  get 'profile', :to => 'user_profiles#show', :as => :profile
  get 'profile/edit', :to => 'user_profiles#edit', :as => :edit_user_profile
  put 'profile/update', :to => 'user_profiles#update', :as => :user_profiles

  post 'cart/add(.:format)', :to => 'carts#add'

  #get 'profile', :to => 'user_profile#show', :as => :user_profiles
  
  #get 'profile/edit', :to => 'user_profiles#edit', :as => :user_profiles
  #get 'profile/update', :to => 'user_profiles#update', :as => :update_user_profile
  
  resources :user_orders

  resources :courses  
  
  root :to => 'home#welcome'

  constraints(:subdomain => /admin/) do
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
    
  end
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
  
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
