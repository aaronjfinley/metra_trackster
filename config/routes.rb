Rails.application.routes.draw do
  # Routes for the Train resource:
  # CREATE
  get "/trains/new", :controller => "trains", :action => "new"
  post "/create_train", :controller => "trains", :action => "create"

  # READ
  get "/trains", :controller => "trains", :action => "index"
  get "/trains/:id", :controller => "trains", :action => "show"

  # UPDATE
  get "/trains/:id/edit", :controller => "trains", :action => "edit"
  post "/update_train/:id", :controller => "trains", :action => "update"

  # DELETE
  get "/delete_train/:id", :controller => "trains", :action => "destroy"
  #------------------------------

  # Routes for the Arrival resource:
  # CREATE
  get "/arrivals/new", :controller => "arrivals", :action => "new"
  post "/create_arrival", :controller => "arrivals", :action => "create"

  # READ
  get "/arrivals", :controller => "arrivals", :action => "index"
  get "/arrivals/:id", :controller => "arrivals", :action => "show"

  # UPDATE
  get "/arrivals/:id/edit", :controller => "arrivals", :action => "edit"
  post "/update_arrival/:id", :controller => "arrivals", :action => "update"

  # DELETE
  get "/delete_arrival/:id", :controller => "arrivals", :action => "destroy"
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
