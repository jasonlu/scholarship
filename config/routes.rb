Scholarship::Application.routes.draw do
  get "inbox", :to => 'inbox#index'

  get "inbox/:id", :to => 'inbox#show'

  put "inbox/read/:id", :to => 'inbox#read'

  delete "inbox/delete/:id", :to => 'inbox#delete'

  devise_for :users, :controllers => { :registrations => "registrations" }
  constraints(:subdomain => /admin/) do
    mount Ckeditor::Engine => '/ckeditor'
    mount RailsAdmin::Engine => '/', :as => 'rails_admin'
    
  end
  

  #resources :news  
  get "news/:title", :to => 'news#show', :as => :news_item
  get "news", :to => 'news#index', :as => :news_index
  get "my_account", :to => 'my_account#profile', :as => :my_account
  get "my_account/profile"
  get "my_account/cart"
  get "my_account/receipt"
  get "my_account/choose_start_day"
  get "my_account/study_record"
  get "my_account/self_learning"
  get "my_account/news"
  get "my_account/logout"

  get "calendar", :to => 'my_account#calendar'
  #resources :carts
  

  resources :pages
  resources :site_configs
  #resources :user_profiles
  
  get 'profile', :to => 'user_profiles#show', :as => :user_profiles
  get 'profile', :to => 'user_profiles#show', :as => :user_profile
  get 'profile', :to => 'user_profiles#show', :as => :profile
  get 'profile/edit', :to => 'user_profiles#edit', :as => :edit_user_profile
  put 'profile/update', :to => 'user_profiles#update', :as => :user_profiles

  post 'cart/add(.:format)', :to => 'carts#add'

  post 'order/new', :to => 'user_orders#new'
  get 'order/new/:order_number', :to => 'user_orders#new', :as => :new_user_order
  get 'orders', :to => 'user_orders#show', :as => :user_orders

  get 'cart', :to => 'carts#show', :as => :cart
  get 'study', :to => 'studies#index', :as => :studies
  get 'study/:id', :to => 'studies#show', :as => :study
  get 'study/:id/edit', :to => 'studies#edit', :as => :edit_study
  #resources :studies
  #get 'profile', :to => 'user_profile#show', :as => :user_profiles
  
  #get 'profile/edit', :to => 'user_profiles#edit', :as => :user_profiles
  #get 'profile/update', :to => 'user_profiles#update', :as => :update_user_profile
  resources :user_orders
  resources :courses  
  root :to => 'home#welcome'
  

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
  #match ':controller(/:action(/:id))(.:format)'
  #get '/books/read/1'
  

end
