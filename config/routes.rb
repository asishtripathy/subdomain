Subdomain::Application.routes.draw do
  
  devise_for :users , controllers: {sessions:'sessions', registrations:'registrations', omniauth_callbacks: 'omniauth_callbacks'} 

  devise_scope :user do
    get 'completion/:id' => 'registrations#completion', as: :completion
    patch 'complete_signup' => 'registrations#complete_signup', as: :complete_signup
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :companies do
    member do
      resources :products
    end
  end
  resources :carts do
    member do
      
    end
  end
  resources :cart_items

  
  #constraints(Subdomain) do
    #resources :companies ,only:[:show] do
       #get '/' => 'companies#show', :constraints => { :subdomain => /.+/ }
       #get '/' => 'products#index', :constraints => { :subdomain => /.+/ }
    #Send
    
    #resources :products
    #root to: 'products#index', as: 'company_index'
  #end

  # You can have the root of your site routed with "root"
  root to: 'companies#index'

  # o resource route with options:
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
  namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
       resources :companies
       resources :users , :products
  end
end
