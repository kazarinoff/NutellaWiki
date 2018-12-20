Rails.application.routes.draw do
  root 'users#new'
  get '/login', :to => 'users#new', as:'login'
  post '/login', :to => 'sessions#create'
  get '/logout' => 'sessions#destroy', as:'logout'
  post '/sessions/new' =>'sessions#create'
  
  get 'pages/index', as:'pages_index'
  get 'pages/new', as:'new_page'
  post 'pages/create' =>'pages#create', as:'create_page'
  get 'pages/:id' => 'pages#show', as:'show_page'
  get 'pages/:id/edit' =>'pages#edit', as:'edit_page'
  post 'pages/:id/edit' => 'pages#update', as:'update_page'
  get 'pages/:id/delete' => 'pages#confirmdelete', as:'confirm_delete_page'
  post 'pages/:id/delete' => 'pages#destroy', as:'delete_page'

  get 'users/:id' => 'users#show', as:'show_user'
  get 'users/:id/edit' => 'users#edit', as:'edit_user'
  post 'users/create' => 'users#create', as:'create_user'

  get 'blocks/new' => 'blocks#new', as:'new_block'
  post 'blocks/create' => 'blocks#create', as:'create_block'
  get 'blocks/:id' => 'blocks#show', as:'show_block'
  get 'blocks/:id/edit' => 'blocks#edit', as:'edit_block'
  post 'blocks/:id/edit' => 'blocks#update', as:'update_block'
  get 'blocks/:id/delete' => 'blocks#confirmdelete', as:'confirm_delete_block'
  post 'blocks/:id/delete' => 'blocks#destroy', as:'delete_block'
  delete 'blocks/:id' => 'blocks#destroycomment', as:'delete_comment'

  post 'comments/create' => 'blocks#createcomment', as:'create_comment'

  # get   '/login', :to => 'sessions#new', :as => :login
  # post '/auth/developer/callback'

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
