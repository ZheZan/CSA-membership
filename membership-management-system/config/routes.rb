Rails.application.routes.draw do
  get 'sessions/new'
  get 'admin_sessions/new'

  resources :dynasties
  resources :point_rules
  resources :admins

  get 'static_pages/help'
  get 'static_pages/adminhome'
  get 'static_pages/report'
  get 'static_pages/about'
  get 'static_pages/privacy'
  get 'static_pages/terms'
  get 'static_pages/characters'
  get 'static_pages/imagesmembers'
  get 'static_pages/imagesvolunteer'
  get 'static_pages/imagessports'

resources :users do
  member do
    get 'showevent'
    get 'register'
    get 'checkin'
    get 'eventinfo'
  end
end

 resources :events do
   member do
    get 'changepoint'
    patch 'changeexecute'
  end
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'
  get 'static_pages/signup' => 'users#new'
  
  get 'static_pages/login'  => 'sessions#new'
  post 'events/:id' => 'events#checkin'
  post 'static_pages/login'   => 'sessions#create'
  delete 'static_pages/logout'  => 'sessions#destroy'
  patch 'users/:id' => 'events#changeexecute'
  
  get 'adminlogin'   => 'admin_sessions#new'
  post 'adminlogin'   => 'admin_sessions#create'
  delete 'adminlogout'  => 'admin_sessions#destroy'

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
