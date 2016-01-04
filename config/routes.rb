Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'
  # Example of xregular route:

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

  get 'events/map' => 'events#map'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/facebook/callback', to: 'sessions#create'
  # get '/auth/twitter/callback?denied*', to: 'welcome#index'

  get 'about' => 'welcome#about'
  get 'signup' => 'users#new'
  resources :users, :events

  get 'allevents' => 'allevents'
  get 'allevents/update' => 'allevents#update'

  post 'events/join/:id', to: 'events#join', as: :join
  put 'events/leave/:id', to: 'events#leave', as: :leave
  put 'events/creator_leave/:id', to: 'events#creator_leave', as: :creator_leave

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :sessions, only: [:new, :create, :destroy]
  resources :search, only: [:new, :index]


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
  # match "*path", to: "welcome#index", via: :all

end
